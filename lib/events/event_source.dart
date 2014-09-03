library angular.events.event_source;

import "event.dart" show Event;

/**
 * An injectable interfaces which allows the directive to fire events.
 * 
 *     @Component(...)
 *     class MyComponent {
 *       EventSource eventSource;
 *       MyComponent(this.eventSource);
 * 
 *       doSomething() {
 *         dynamic optionalPayload = ...;
 *         eventSource.emit('custom-event', data: optionalPayload);
 *       }
 *     }
 */
class EventSource {
  
  /**
   * Emit events up the DOM hierarchy. If Any [Directive] has registered
   * a listener on the event than execute that listener.
   * 
   * The events fallow the DOM hierarchy, but are more efficient since they are not backed by
   * a DOM event. Events stop at ShadowDOM bondries to maintain encapsulation.
   */
  Event emit(String name, {data}) { return null; }
}