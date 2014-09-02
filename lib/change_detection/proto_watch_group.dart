library change_detection.proto_watch_group;

class ProtoWatchGroup {
  ProtoRecord head, tail;
  WatchGroup instantiate();
}