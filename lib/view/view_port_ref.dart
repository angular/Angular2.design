library angular.dom.view_port_ref;

import "view_port.dart" show ViewPor;
import "view_ref.dart" show ViewRef;

/**
 * Since ViewPorts are cacheable the goal is to never give out an instance of [ViewPort] to an application,
 * instead to [ViewPort]s are wrapped in [ViewPortRef]. This way, even if the application fails to release a
 * [ViewPortRef], the underlying [ViewPort] can be released and reused and the [ViewPortRef] rendered stale.
 */
class ViewPortRef {
  /**
   * A private References to a cachable [ViewPort].
   */
  ViewPort _viewPort;

  /**
   * True if underlying view has been released/reused.
   */
  bool get isStale => _view == null;

  View insert(ViewRef view, { View insertAfter }) =>
      _viewPort.insert(unwrapView(view), insertAfter: unwrapView(insertAfter));

  ViewRef move(ViewRef view, { ViewRef insertAfter }) =>
      _viewPort.move(unwrapView(view), insertAfter: unwrapView(view));

  ViewRef remove(ViewRef view) =>
      _viewPort.remove(unwrapView(view));
}

/// PRIVATE METHOD TO FROMEWORK
ViewPort unwrapViewPort(ViewPortRef viewPortRef) => viewPortRef._viewPort;
