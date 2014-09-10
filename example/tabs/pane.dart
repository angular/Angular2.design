library example.tabs.pane;

import "../../lib/angular.dart";

@Template(
  selector: 'pane',
  templatize: Templatize.CHILDREN
)
class Pane {
  ViewFactory _viewFactory;
  ViewPortRef _viewPort;
  ViewRef _view;
  
  @Property('name')
  String name;
  
  @Property('value')
  dynamic value;
  
  @Property('icon')
  String icon;
  
  Pane(this._viewFactory, this._viewPort);
  
  @Property('selected')
  bool _selected;
  get selected => _selected;
  set selected(bool selection) {
    if (selection) {
      if (_view == null) {
        _view = _viewPort.insert(_viewFactory);
      }
    } else {
      if (_view != null) {
        _viewPort.remove(_view);
        _view = null;
      }
    }
  }
}
