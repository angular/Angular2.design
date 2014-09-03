library angular.annotations.directive;

import "visibility.dart" show Visibility;

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
   * A directive/component controller class can be injected into other
   * directives/components. This attribute controls whether the
   * controller is available to others.
   *
   * * `local` [Directive.LOCAL_VISIBILITY] - the controller can be injected
   *   into other directives / components on the same DOM element.
   * * `children` [Directive.CHILDREN_VISIBILITY] - the controller can be
   *   injected into other directives / components on the same or child DOM
   *   elements.
   * * `direct_children` [Directive.DIRECT_CHILDREN_VISIBILITY] - the
   *   controller can be injected into other directives / components on the
   *   direct children of the current DOM element.
   */
  final Visibility visibility;

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
   */
  final Map<String, String> events;
  
  
  final Map<String, String> bind;
  
  
  final Map<String, String> observe;
  
  
  final bool canChangeModel;
  
  const Directive({ 
    this.selector,
    this.visibility,
    this.events,
    this.bind,
    this.observe,
    this.canChangeModel
  });
}
