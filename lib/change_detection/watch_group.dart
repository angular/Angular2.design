library change_detection.watch_group;

class WatchGroup {
  Record _headMarker, _tailMarker
  WatchGroup _parent, _next, _prev;
  WatchGroup _childHead, _childTail;
  void remove();
  ChangeListener watch(...);
  int processChanges() {...}; // return the # of changes
}
