library example.tabs.tabs;

import "../../lib/angular.dart";
import "pane.dart" show Pane;

@Component(
  selector: 'tabs',
  templateUrl: 'tabs.dart'
)
class Tabs {
  Query<Pane> panes;
  Function emitChange;
  
  @Property('selected')
  Pane _selectedPane;
  get selected => _selectedPane == null ? null : _selectedPane.value;
  set selected(v) {
    _selectedPane = panes.firstWhere((p) => p.value == v);
  }

  Tabs(@children this.panes, @Event('change') this.emitChange);
  
  select(Pane selectedPane) {
    if (_selectedPane != null) _selectedPane.selected = false;
    _selectedPane = selectedPane;
    _selectedPane.selected = true;
    emitChange();
  }
}
