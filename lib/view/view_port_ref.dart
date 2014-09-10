library angular.dom.view_port_ref;

import "view.dart" show wrapView;
import "view_ref.dart" show unwrapView;
import "view_port.dart" show ViewPort;
import "view_ref.dart" show ViewRef;
import "view_factory.dart" show ViewFactory;

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
  bool get isStale => _viewPort == null;

  ViewRef insert(ViewFactory viewFactory, { ViewRef insertAfter }) =>
      wrapView(_viewPort.insert(unwrapView(viewFactory.create()),
               insertAfter: unwrapView(insertAfter)));

  ViewRef move(ViewRef view, { ViewRef insertAfter }) =>
      wrapView(_viewPort.move(unwrapView(view), insertAfter: unwrapView(view)));

  ViewRef remove(ViewRef view) =>
      wrapView(_viewPort.remove(unwrapView(view)));
}

/// PRIVATE METHOD TO FRAMEWORK
ViewPort unwrapViewPort(ViewPortRef viewPortRef) => viewPortRef._viewPort;
