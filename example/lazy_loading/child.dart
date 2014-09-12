library example.lazy_loading.child;

import 'base.dart' show Server;

var NG_MODULE = new Module()
    ..bind(MainPage);

var NG_TEMPLATE = new TemplateModule()
    ..include('ngCore')
    ..bindDirective(Main);


@Inject
class MainPage {
  Server server;
  MainPage(this.server);
}

@Component(
  selector: 'main'
)
class Main {
  MainPage mainPage;
  Main(this.mainPage);
}