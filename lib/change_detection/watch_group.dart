library change_detection.watch_group;

import "record.dart" show Record;
import "change_listener.dart" show ChangeListener;

class WatchGroup {
  Record _headMarker, _tailMarker;
  WatchGroup _parent, _next, _prev;
  WatchGroup _childHead, _childTail;
  void remove() {}
  ChangeListener watch() { return null; }
  int processChanges() { return 0; } // return the # of changes
}
