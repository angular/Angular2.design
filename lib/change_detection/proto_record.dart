library change_detection.proto_record;

import "record.dart" show Record;

class ProtoRecord {
  // SAME FIELDS AS RECORD (BUT PROTOTYPE VERSIONS)

  // negative modes are same as positive ones, 
  // but should be removed from the check queue after check.
  int _mode;

  /// order list of all records. Including head/tail markers
  ProtoRecord _next, _previous;

  /// next record to dirty check (doubly to remove notified records)
  ProtoRecord _checkNext, _checkPrevious;

  // next notifier
  ProtoRecord _notifierNext;

  /// The record that triggers notifyListeners
  ProtoRecord _recordSrc; 
  /// The head of the list of listener to trigger
  ProtoChangeListener _listenerHead;
  /// The link that form the listener list
  ProtoChangeListener _listenerNext;


  ////////
  // temporary location to store instance while resolving pointers
  Record instance;
}

class ProtoChangeListener{}