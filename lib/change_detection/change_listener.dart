library change_detection.change_listener;

import "record.dart" show Record;

abstract class ChangeListener {
  Record _triggerRecord;
  ChangeListener _listenerNext;
  void onChange(value, previousValue);
}