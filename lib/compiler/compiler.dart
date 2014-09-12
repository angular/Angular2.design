library angular.compiler.compiler;

import 'dart:html' show Element, DocumentFragment;
import 'dart:sync' show Future;
import 'selector.dart' show Selector;

/**
 * #Phasese
 *   - rewrite phase of ${}
 *     Goal: only have elements (may include macros and bidi support)
 *       <span foo="${bar}">${a}<hr>Helo ${b}</span>
 *       <span [foo]="bar|strigify" 
 *             [text|0]="a|stringify" 
 *             [text|4]="b|stringify"><hr>Hello<!--${b}-->/span>
 *   - compile phase works with elements only.
 * 
 * # Algorithm
 * 
 * Let's start with the following template:
 * 
 *     <div>
 *       <pane [ng-repeat|p]="items" name="${p.name}">Hello ${p.name}</pane>
 *     </div>
 * 
 * 
 * ## Rewrite Phase
 * 
 * At this point we allow macros to change the structure of the DOM. One
 * set of built it in macros are `${}` for the attributes and text interpolation.
 * 
 *     <div>
 *       <pane [ng-repeat|p]="items" 
 *             [name]="p.name|stringify"
 *             [text|2]="p.name|stringify">Hello<!--${p.name}--> </pane>
 *     </div>
 * 
 * ## Selector Phase
 * 
 * Given these selectors
 * 
 *     @Template(
 *       selector: '[ng-repeat|(ident)]',
 *       binding: {
 *         'collection': 'ngRepeat',
 *         'identifier': 'ident'
 *       }
 *     )
 *     class NgRepeat {
 *       var collection;
 *       String identifier;
 *     }
 * 
 *     @Template(
 *       selector: 'pane'
 *     )
 *     class NgRepeat{}
 * 
 * At this point we recursively walk the tree and feed Elements to selector
 * to get [ElementMarkup] data structure from the [Selector]. If [Selector]
 * returns [ElementMarkup] we add `ng-binding` to the class for easier retrieval
 * later (using `getElementsByClassName('ng-binding')`).
 * 
 *     <div>
 *       <pane [ng-repeat|p]="items"
 *             [name]="p.name|stringify"
 *             [text|2]="p.name|stringify">Hello<!--${p.name}--> </pane>
 *     </div>
 * 
 *     <div> -> ELementMarkup: null;
 * 
 *     <pane> -> ElementMarkup:
 *        depth: 1; // <pane> is first child of root <div>
 *        component: null;
 *        template: [@Template(...), NgRepeat, {ident:'p'}];
 *        childrenTemplate: [@Template(...), Pane, null];
 *        decorators: [];
 *        propBindings: { 
 *            'name': 'p.name|stringify',
 *            'ng-repeat': 'items'
 *        };
 *        childTextBindings: [null, null, 'p.name|stringify'];
 *
 * ## Processing ElementMarkup
 * 
 * Element markup is processed in Templatize.Element, Templatize.Children, process
 * decorators. This means that ELementMarkup may have to be broken down in
 * this phase.
 * 
 * ### Templatize.Element
 * 
 * Replace Element with anchor, extract ElementMarkup with template only.
 * 
 *     ViewProto
 *       <div>
 *         <template class="ng-binding"></template>
 *       </div>
 * 
 *     <div> -> ELementMarkup: null;
 * 
 *     <template> -> ElementMarkup:
 *        depth: 1; // <pane> is first child of root <div>
 *        component: null;
 *        template: [@Template(...), NgRepeat, {ident:'p'}];
 *        childrenTemplate: null;
 *        decorators: [];
 *        propBindings: { 
 *            'ng-repeat': 'items'
 *        };
 *        childTextBindings: null;
 * 
 *     =========================
 * 
 *     ChildViewProto -> ViewFactory for ng-repeat:
 *       <pane [ng-repeat|p]="items" 
 *           [name]="p.name|stringify"
 *           [text|2]="p.name|stringify">Hello<!--${p.name}--> </pane>
 * 
 *     <pane> -> ElementMarkup:
 *        depth: 0; // <pane> is first child of root <div>
 *        component: null;
 *        template: null;
 *        childrenTemplate: [@Template(...), Pane, null];
 *        decorators: [];
 *        propBindings: { 
 *            'name': 'p.name|stringify',
 *        };
 *        childTextBindings: [null, null, 'p.name|stringify'];
 * 
 * ### Templatize.Children
 * 
 * Replace Element childrend with anchor, extract ElementMarkup with template only.
 * 
 *     ViewProto
 *       <div>
 *         <template class="ng-binding"></template>
 *       </div>
 * 
 *     <div> -> ELementMarkup: null;
 * 
 *     <template> -> ElementMarkup:
 *        depth: 1; // <pane> is first child of root <div>
 *        component: null;
 *        template: [@Template(...), NgRepeat, {ident:'p'}];
 *        childrenTemplate: null;
 *        decorators: [];
 *        propBindings: { 
 *            'ng-repeat': 'items'
 *        };
 *        childTextBindings: null;
 * 
 *     =========================
 * 
 *     ChildViewProto -> ViewFactory for ng-repeat:
 *       <pane [ng-repeat|p]="items" 
 *           [name]="p.name|stringify"
 *           [text|2]="p.name|stringify" class="ng-binding">
 *         <template class="ng-binding"></template>
 *       </pane>
 * 
 *     <pane> -> ElementMarkup:
 *        depth: 0; // <pane> is first child of root <div>
 *        component: null;
 *        template: null;
 *        childrenTemplate: [@Template(...), Pane, null];
 *        decorators: [];
 *        propBindings: { 
 *            'name': 'p.name|stringify',
 *        };
 *        childTextBindings: null;
 * 
 *     <template> -> null
 * 
 *     =========================
 * 
 *     ChildViewProto -> ViewFactory for pane:
 *       <template>Hello<!--${p.name}--> </template>
 * 
 *     <template> -> ElementMarkup:
 *        depth: 0; // <pane> is first child of root <div>
 *        component: null;
 *        template: null;
 *        childrenTemplate: [@Template(...), Pane, null];
 *        decorators: [];
 *        propBindings: null
 *        childTextBindings: [null, null, 'p.name|stringify'];
 * 
 * 
 * 
 * #NOTES
 * - Use getElementsByClassName('ng-binding') 
 *   http://jsperf.com/getelementsbyclassname-vs-queryselectorall/94
 * 
 */
class Compiler {
  // key: value of ng-config from templates as normalized uri
  Map<String, Selector> selectorCache = new HashMap();
  
  TemplateConfigResolver configResolver;
  
  Future<ProtoView> compile(String url);
  
  /**
   * # Why future?
   *   - compilation will load templates. Instantiating views before templates are loaded will 
   *     complicate the Directive code. BENEFIT: view instantiation become synchrnous.
   * # Why result that is independent of injector?
   *   - don't know about injector in deserialization
   *   - compile does not need the injector, only the ViewFactory does
   */
  Future<ProtoView> compile(TemplateElement element) {
  }
}


