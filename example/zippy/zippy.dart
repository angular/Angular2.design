library example.zippy;

import "../../lib/angular.dart";

@Component(
  selector: 'zippy',
  templateUrl: 'zippy.template.html'
)
class Zippy {
  @Property('title')
  String title;
  
  @Property('opened')
  bool opened = false;
  
  void open() {
    opened = true;
  }
  
  void close() {
    opened = false;
  }
  
  void toggle() {
    opened != opened;
  }
}