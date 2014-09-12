library angular.dom.proto_view;

class ProtoView {
  final List<Module> modules = null;
  final TemplateElement template = null;
  final List<ProtoViewPort> protoViewPorts = null;
  /// index of this injectors matches the order of getElementsByClassName()
  final List<ProtoDirectiveInjector> protoDirectiveInjectors = null;
  // TODO(misko/tobias): Do we actually need diges/flush pair? is Single WatchGroup enough?
  final ProtoWatchGroup protoWatchGroupDigest = null;
  final ProtoWatchGroup protoWatchGroupFlush = null;
  
  // TODO(misko): What about event registration?

  View instance;
}