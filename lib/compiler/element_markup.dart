/**
 *  <span foo="${bar}">${exp}</span>
 *  <span [foo]="bar|strigify" [text|0]="exp|stringify">
 */

class ElementMarkup {
  /**
   * Distance to root element of the template counting all element whether or not
   * they have markup on them. (If root element is child only, then it is not counted).
   * Root element is index of 0.
   */
  int depth;
  
  ProtoDirective component;
  ProtoDirective template;
  ProtoDirective childrenTemplate;
  ProtoView templateProtoView; // Usde by component/template/childrenTemplate;
  final List<ProtoDirective> decorators = <ProtoDirective>[];
  final Map<String, Expression> propBindings = new <String, Expression>HashMap();
  final List<Expression> childTextBindings = <Expression>[];
  final Map<String, Expression> events = new <String, Expression>HashMap();
  String id;
  
}
