library angular.dom.view_ref;

import "view.dart" show View;

/**
 * Since Views are cacheable the goal is to never give out an instance of [View] to an application,
 * instead to [View]s are wrapped in [ViewRef]. This way, even if the application fails to release a
 * [ViewRef], the underlying [View] can be released and reused and the [ViewRef] rendered stale.
 */
// TODO(tobias): Do we really need this? 
// TODO(chirayu): Seems helpful.
class ViewRef {
  /**
   * A private References to a cachable [View].
   */
  View _view;

  /**
   * True if underlying view has been released/reused.
   */
  bool get isStale => _view == null;

  /**
   * Print current View for debugging reasons.
   */
  toString() => isStale ? '<<stale>>' : _view.toString();
}

/// PRIVATE METHOD TO FRAMEWORK
View unwrapView(ViewRef viewRef) => viewRef._view;
