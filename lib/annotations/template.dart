library angular.annotations.template;

import "directive.dart" show Directive;

class Template extends Directive {
  final Templatize templatize;

  const Template({
    String selector,
    Map<String, String> events,
    Map<String, String> bind,
    Map<String, String> observe,
    bool canChangeModel,
    Templatize templatize
  }): super(
    selector: selector,
    events: events,
    bind: bind,
    observe: observe,
    canChangeModel: canChangeModel),
    templatize = templatize;
}

class Templatize {
  static const SELF = const Templatize._('SELF');
  static const CHILDREN = const Templatize._('CHILDREN');
  
  final String name;
  
  const Templatize._(this.name);
}