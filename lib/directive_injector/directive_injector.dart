library angular.directive.injector;

import "proto_directive_injector.dart" show ProtoDirectiveInjector;
import "query.dart" show Query;
import "../animation/animate.dart" show Animate;
import "../dom/element_probe.dart" show ElementProbe;
import "../dom/ng_element.dart" show NgElement;
import "../dom/source_light_dom.dart" show SourceLightDom;
import "../dom/destination_light_dom.dart" show DestinationLightDom;
import "../view/view.dart" show View;
import "../view/view_port.dart" show ViewPort;
import "../view/view_factory.dart" show ViewFactory;
import "dart:html" show Element, ShadowRoot;


/**
 * [DirectiveInejctor]s closly mirror the DOM elements (elements which have no directives have no 
 * [DirectiveInjector]).
 */
class DirectiveInjector {
  ProtoDirectiveInjector _protoInjector;
  DirectiveInjector _parent;
  

  /**
   * For performance reasons the Injector only supports 10 directives per element.
   * 
   * NOTE: linear search over fields is faster than HashMap lookup.
   */
   dynamic _cObj; // Compnonent only
   dynamic _obj0;
   dynamic _obj1;
   dynamic _obj2;
   dynamic _obj3;
   dynamic _obj4;
   dynamic _obj5;
   dynamic _obj6;
   dynamic _obj7;
   dynamic _obj8;
   dynamic _obj9;
   
   Element element;
   NgElement ngElement;
   ShadowRoot shadowRoot;
   ElementProbe elementProbe;
   View view;
   ViewPort viewPort;
   ViewFactory viewFactory;
   Animate animate;
   DestinationLightDom destinationLightDom;
   SourceLightDom sourceLightDom;
   
   
  /**
   * For performance reasons the Injector only supports 2 [Query] per element.
   * 
   * NOTE: linear search over fields is faster than HashMap lookup.
   */
   Query _query0; int _querySelectorId0;
   Query _query1; int _querySelectorId1;
   
}