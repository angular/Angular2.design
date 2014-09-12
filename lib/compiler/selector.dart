library angular.compiler.selector;

import "dart:html" show Element;

/**
 * # What can we select?
 *   - Directives
 *   - Markup: (event) [property], #name
 * 
 * <div [ng-if]>${foo}</div>
 * 
 */
class Selector {
  List<ProtoDirective> protoDirectives;
  
  ElementBinder matchElement(Element element) {}
  
}

