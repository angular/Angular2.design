library change_detection.change_listener;


abstract class ChangeListener {
  Record _triggerRecord;
  ChangeListener _listenerNext;
  void onChange(value, previousValue);
  void remove();
}