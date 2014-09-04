library angular.directive_injector.query;

/**
 * A directive can inject a list of child directives using [Query].
 * 
 * A [Query] needs to be further scoped as [@self], [@children], or [@descendents].
 * 
 * Example:
 *     @Component(
 *       selector: 'tabs',
 *       template: '<ul><li [ng-repeat|pane]="panes">${pane.title}</li></ul>'
 *     )
 *     class Tabs {
 *       // COMMENT(deboer): This should also (or only) support Elements, not components.  Otherwise
 *       // we will have a hard time supporting Web Components.
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
// COMMENT(deboer): This should by a List isn't of an UnmodifieableListView since the set of elements can change over the course of the Query's life time.
class Query<T> extends UnmodifiableListView<T> {
}
