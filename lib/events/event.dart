library angular.events.event;

/**
 */
class Event {

  /**
   * Data attached to the event. This would be the optional parameter from [EventSource.emit].
   */
  final dynamic data;

  final String name;

  /// true or false depending on if [stopPropagation] was executed.
  bool get propagationStopped => _propagationStopped;
  bool _propagationStopped = false;

  /// true or false depending on if [preventDefault] was executed.
  bool get defaultPrevented => _defaultPrevented;
  bool _defaultPrevented = false;

  /**
   * [name]: The name of the scope event.
   * [data]: Arbitrary data attached to the event.
   */
  Event(this.name, this.data);

  /// Prevents the intercepted event from propagating further
  void stopPropagation () {
    _propagationStopped = true;
  }

  /// Sets the defaultPrevented flag to true.
  void preventDefault() {
    _defaultPrevented = true;
  }
}