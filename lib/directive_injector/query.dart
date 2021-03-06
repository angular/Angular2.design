library angular.directive_injector.query;

import "dart:collection" show ListBase, Iterable;
import "directive_injector.dart" show DirectiveInjector;

/**
 * A directive can inject a list of child directives using [Query].
 * 
 * A [Query] needs to be further scoped as [@self], [@children], [@descendents].
 * // TODO(misko): I don't think we need to query shadow DOM, since the shadow DOM is dreven from 
 *    the component as the model, and hence the component knows everything about the shadow DOM.
 * 
 * Example:
 * 
 *     @Component(
 *       selector: 'tabs',
 *       template: '<ul><li [ng-repeat|pane]="panes">${pane.title}</li></ul>'
 *     )
 *     class Tabs {
 *       Query<Pane> panes;
 * 
 *       Tabs(@children this.panes);
 * 
 *       onEvent() {
 *         panes.iterable.forEach((p) => p.notify());
 *       }
 *     }
 * 
 *     @Component(
 *       selector: 'pane',
 *       map: const {'title': 'title'}
 *     )
 *     class Pane {
 *       String title;
 *       notify() {
 *         // dosomething
 *       }
 *     }
 * 
 * 
 *     <tabs>
 *       <pane title="Overview"></pane>
 *       <pane [ng-repeat|p]="paneList" [title]="p.name"></pane>
 *     <tabs>
 * 
 *
 * A [Query] is an observable object:
 *
 *     @Component(
 *       selector: 'tabs',
 *       template: '<ul><li [ng-repeat|pane]="panes">${pane.title}</li></ul>'
 *     )
 *     class Tabs {
 *       Query<Pane> panes;
 * 
 *       Tabs(@children this.panes) {
 *         panes.listen(() => processUpdatedPanes(panes));
 *       }
 *     }
 * 
 * DESIGN: https://docs.google.com/document/d/1d-yxmxMVqZHHadvxQaC2CCvcAR17JUQ1Qs4RT6Rwp6Y
 */
class Query<T> extends ListBase<T> {
	///a reference to the injector that created the query
	DirectiveInjector _injector;

	///cached results of the query
	List<T> _list;

	///a boolean indicating if _list is up-to-date.
	bool _dirty;

	List _listeners;

    ///true or false depending on if directive should be included into the result of this query
    //TODO(misko): Why do we need this?
	bool shouldInclude(Object directive) => null;

	///registers a listener that will be notified when the query changes
	void listen(listener) {}

	///marks query as dirty and schedules an async task to notify the listeners.
	void markAsDirty() {}

	operator[](i) => null;
	operator[]=(i, v) {}  //TODO(vsavkin): should not need `operator[]=`. We should provide only read operations.
	set length(val) {}
	get length => null;
}

abstract class _QueryIterable<T> implements Iterable<T> {
	///a reference to the query object that created the iterable
	Query _query;

	///checks if _query.dirty. if true, then recompulte _query._list and call _query._list.forEach. 
	///if false, call _query._list.forEach. 
	///same for all list operations.
	void forEach(fn) {} 
}