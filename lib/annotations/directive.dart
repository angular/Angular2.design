library angular.annotations.directive;

/**
 * Abstract supper class of [Controller], [Component], and [Decorator].
 */
abstract class Directive {

  /**
   * CSS selector which will trigger this component/directive.
   * CSS Selectors are limited to a single element and can contain:
   *
   * * `element-name` limit to a given element name.
   * * `.class` limit to an element with a given class.
   * * `[attribute]` limit to an element with a given attribute name.
   * * `[attribute=value]` limit to an element with a given attribute and value.
   * * `:contains(/abc/)` limit to an element which contains the given text.
   *
   *
   * Example: `input[type=checkbox][ng-model]`
   */
  final String selector;

  /**
   * A directive can request to be notified of events by calling a method. 
   * The events handlers get called by both the Angular events from [EventSource]
   * as well as from DOM events, if prefixed by `#`.
   * 
   *     @Decorator(
   *       selector: ...,
   *       events: const {
   *         "#click": "onDomClick",
   *         "custom": "whenCustom"
   *       }
   *     )
   *     class MyDecorator {
   *       onDomClick(dom.Event event) { ... }
   *       whenCustom(Event event) { ... }
   *     }
   *
   * 
   * DESIGN: https://docs.google.com/document/d/1d-yxmxMVqZHHadvxQaC2CCvcAR17JUQ1Qs4RT6Rwp6Y
   */
  final Map<String, String> events;
  

  final Map<String, String> bind;
  
  
  final Map<String, String> observe;
  
  
  final bool canChangeModel;
  
  const Directive({ 
    this.selector,
    this.events,
    this.bind,
    this.observe,
    this.canChangeModel
  });
}
