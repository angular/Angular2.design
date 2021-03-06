library angular.annotations.component;

import "directive.dart" show Directive;

class Component extends Directive {
  final String templateUrl;
  
  const Component({
    String selector,
    Map<String, String> events,
    Map<String, String> bind,
    Map<String, String> observe,
    bool canChangeModel,
    String templateUrl
  }): super(
    selector: selector,
    events: events,
    bind: bind,
    observe: observe,
    canChangeModel: canChangeModel),
    templateUrl = templateUrl;
}