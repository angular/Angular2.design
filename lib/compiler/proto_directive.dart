
class ProtoDirective {
  Type type;
  Directive annotation;
  // TODO(tbosch): Syntax [prop|param] implies that the param is part
  // of the binding, but it should actually be a parameter to the directive
  // Is the syntax right?
  Map<String, String> parameters;
}