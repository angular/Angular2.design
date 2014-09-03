library angular.directive_injector.query;

/**
 * A directive can inject a list of child directives using [Query].
 * 
 * A [Query] needs to be further scoped as [@self], [@children], or [@descendents].
 * 
 * Example:
 * 
 *     @Component(
 *       selector: 'tabs',
 *       template: '<ul><li [ng-repeat|pane]="panes">${pane.title}</li></ul>'
 *     )
 *     class Tabs {
 *       @children Query<Pane> panes;
 * 
 *       Tabs(this.panes) {}
 *     }
 * 
 *     @Component(
 *       selector: 'pane',
 *       map: const {'title': 'title'}
 *     )
 *     class Pane {
 *       String title;
 *     }
 * 
 * 
 *     <tabs>
 *       <pane title="Overview"></pane>
 *       <pane [ng-repeat|p]="paneList" [title]="p.name"></pane>
 *     <tabs>
 * 
 * 
 * DESIGN: https://docs.google.com/document/d/1d-yxmxMVqZHHadvxQaC2CCvcAR17JUQ1Qs4RT6Rwp6Y
 */
class Query<T> extends UnmodifiableListView<T> {
}