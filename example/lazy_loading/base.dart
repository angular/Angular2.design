library example.lazy_loading.base;

import 'package:di/di.dart' show Module;
import 'package:angular/angular.dart';

var NG_MODULE = new Module()
    ..install(new NgCoreModule())
    ..bind(Server)

var NG_TEMPLATE = new TemplateModule()
    ..include('ngCore')
    ..bindDirective(App);

@Inject
class Server {}

@Inject
class MainPage {
  Server server;
  MainPage(this.server);
}

@Component(
  selector: 'app',
  templateUrl: 'app.html',
  provides: [MainPage]
)
class App {
  Server server;
  App(this.server);
}