library change_detection.record;

import "change_listener.dart" show ChangeListener;
import "watch_group.dart" show WatchGroup;

/**
 * Represents a Record for keeping track of changes. A change is a difference between previous
 * and current value. 
 * 
 * By default changes are detected using dirty checking, but a notifier can be present which can
 * notify the records of changes by means other than dirty checking. For example Object.observe
 * or events on DOM elements.
 * 
 * DESIGN NOTES:  
 *  - No inheritance allowed so that code is monomorphic for performance. 
 *  - Atomic watch operations
 *  - Defaults to dirty checking
 *  - Keep this object as lean as possible. (Lean in number of fields)
 * 
 * MEMORY COST: 13 Words;
 */
class Record implements ChangeListener {
  /// Used to designate records as markes.
  static final int MODE_MARKER = 0;
  static final int MODE_PROPERTY = 1;
  static final int MODE_INVOKE_CLOSURE = 2;
  static final int MODE_INVOKE_METHOD = 3;
  static final int MODE_COLLECTION_MAP = 4;
  static final int MODE_COLLECTION_LIST = 5;
  
    
  WatchGroup _watchGroup; // 1

  /**
   * Negative modes are same as positive ones, but should be removed from the check queue after check.
   */
  int _mode; // 2

  /// order list of all records. Including head/tail markers
  Record _next, _previous; // 3, 4

  /// next record to dirty check 
  Record _checkNext, _checkPrev; // 5, 6

  // next notifier
  Record _notifierNext; // 7

  /// Release associated resources
  // TODO(misko): can we have something cheaper than Function?
  Function _release; // 8

  /// The record that triggers notifyListeners
  Record _triggerRecord; // 9
  /// The head of the list of listener to trigger
  ChangeListener _listenerHead; // 10 
  /// The link that form the listener list
  ChangeListener _listenerNext; // 11

  /// Context for evaluation
  var _context; // 12

  /// Previous value (May be collection change record)
  var _previousValue; // 13

  void _moveToNotifyQueue() {
    // unlink from check queue
    // Order does not matter, just add it to the head of
    //     watchGroup._notifyQueue
  }

  void _moveToCheckQueue() {
    // Important that the order of _checkNext is same as _next
    // search _previous until a record in check Queue is found.
    //   - corner case marker?
    // insert this after found record
  }

  bool _processChanges() {
    // remove from check queue if temporary in checkQueue
    // if change detected, use _listenerHead (then _listenerNext)
    // to notify of changes. (removing listener, is rare, but will
    //   require linear sort through _listenerSrc._listenerHead to
    //   unlink)
    return false;
  }

  void onChange(current, previous) {
    _context = current;
  }
}
