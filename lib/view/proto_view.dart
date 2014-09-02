library angular.dom.proto_view;

class ProtoView {
  final List<Node> nodes = null;
  final List<ProtoViewPort> protoViewPorts = null;
  final List<ProtoDirectiveInjector> protoDirectiveInjectors = null;
  // TODO(misko/tobias): Do we actually need diges/flush pair? is Single WatchGroup enough?
  final ProtoWatchGroup protoWatchGroupDigest = null;
  final ProtoWatchGroup protoWatchGroupFlush = null;

  View instance;
}