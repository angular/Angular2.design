library angular.dam.view_factory;

import "view_ref.dart" show ViewRef;

/**
 * # NOTES:
 * 
 * ## Why a ViewFactory as return type and not a ViewProto?
 *   - ViewFactory adds caching to ViewProto. It is also tied to a Injector.
 * ## Why DirectiveMap
 *   - 
 */
// TODO(tobias) is this statless or not?
class ViewFactory {
  ViewRef create() { return null; }
}