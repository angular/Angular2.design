library change_detection.proto_record;

import "record.dart" show Record;

class ProtoRecord {
  // SAME FIELDS AS RECORD (BUT PROTOTYPE VERSIONS)

  int _mode; // See Record.MODE_*

  /// order list of all records. Including head/tail markers
  ProtoRecord _next, _prev;

  /// next record to dirty check
  ProtoRecord _checkNext, _checkPrev;

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