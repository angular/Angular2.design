library change_detection.proto_record;


class ProtoRecord {
  // SAME FIELDS AS RECORD (BUT PROTOTYPE VERSIONS)

  // negative modes are same as positive ones, 
  // but should be removed from the check queue after check.
  int _mode;

  /// order list of all records. Including head/tail markers
  RecordPrototype _next, _previous;

  /// next record to dirty check (doubly to remove notified records)
  RecordPrototype _checkNext, _checkPrevious;

  // next notifier
  RecordPrototype _notifierNext;

  /// The record that triggers notifyListeners
  RecordPrototype _recordSrc; 
  /// The head of the list of listener to trigger
  ChangeListenerProtototype _listenerHead;
  /// The link that form the listener list
  ChangeListenerPrototype _listenerNext;


  ////////
  // temporary location to store instance while resolving pointers
  Record instance;
}
