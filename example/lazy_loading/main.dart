import 'base.dart' defered as base;
import 'child.dart' defferd as child;
import 'package:angular/ng_core.dart' defferd as ngCore;

main() {
   applicationFactory()
      .defferdLib('base', base.loadLibrary)
      .rootContext(HelloWorldController)
      .run();
}

class Main {
   Main(base.Server serever);
}

@Inject
class Server {}
