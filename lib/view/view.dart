library angular.dom.view;

import "dart:html" show Node;
import "view_factory.dart" show ViewFactory;
import "view_port.dart" show ViewPort;
import "view_ref.dart" show ViewRef;
import "../directive_injector/directive_injector.dart" show DirectiveInjector;
import "../lists/linked_list.dart" show LinkedListEntry;
import "../change_detection/watch_group.dart" show WatchGroup;


/**
 * The purpose of the [View] is to:
 *
 * - represent a chunk of DOM that can be efficiently inserted / removed from [ViewPort]
 * - represent a chunk of DOM which is structurally fixed (only attributes, properties, and
 *   text nodes can change).
 * - instantiate Directives
 *
 *
 * # Creation
 *
 * A view is created by [ViewFactory]. The creation process involves cloning template DOM,
 * creating [WatchGroup]s for digest and flush, and setting up the DirectiveInjectors. The
 * creation should contain all of the expensive code, so that we can cache created views.
 * The goal is to make attaching/detaching cheap.
 *
 *
 * # Lifecycle
 *
 * A [View] can be either attached or detached. Attaching a view requires:
 *
 * - Inserting the [View] into [ViewPort]
 * - Linking the DirectiveInjectors, with parent view DirectiveInjectors
 * - Scheduling DOM Writes to attach DOM elements to [ViewPort]s anchor element.
 * - Hydrating directive instances
 *
 * Detaching requires:
 *
 * - Removing [View] from [ViewPort]
 * - Scheduling removal of DOM elements from [ViewPort] anchor element
 * - Releasing DirectiveInjector instances (optionally calling detach on directive instances)
 * - Un-linking the DirectiveInjector
 * 
 * # Logical Structure of View
 * 
 *     View
 *       |
 *       + - DirectiveInjector
 *       |     |
 *       |     + - DirectiveInjector
 *       |
 *       + - DirectiveInjector
 *       |
 *       +-ViewPort
 *          |
 *          +- View
 *          +- View
 *          +- View
 * 
 * NOTE: the DirecitveInjectors are shown as a tree, event though they are stored as depth-first
 *       linked list for fast iteration.
 *
 */
class View extends LinkedListEntry<View> {
  /**
   * The view Factory which created this view and is responsible for caching these Views.
   */
  // TODO(tobias) do we need this here?
  final ViewFactory viewFactory = null;

  // TODO(tobias) maybe we don't need this state here but only in the ViewFactory...
  /// View is ready for reuse.
  static final int STATE_DEHYDRATED = 0;
  /// View is actively used. Directives are instantiated
  static final int STATE_LIVE = 1;
  /// View is dead, but it can not be reused because of animations going on
  static final int STATE_FROZEN = 2;
  int state;

  /**
   * A set of DOM nodes which this [View] considers roots.
   */
  final List<Node> nodes = null;

  /**
   * A [View] can have zero or mare [ViewPort]s. Use head/tail to keep track of the [ViewPort]s. 
   * The [ViewPort] list is fixed once the [View] is created.
   */
  final List<ViewPort> viewPorts = null;

  /**
   * A [View] has a depth-first liste of [DirectiveInjector]s which are used for
   * instantiating the Views.
   */
  final List<DirectiveInjector> directiveInjectors = null;

  /** 
   * TODO(tbosch) rather executed in top-down order?
   * A list of all scheduled DOM read operations. Use head/tail to build the list. 
   * These operations must be executed in the bottom-up order.
  */
  final List<Function> domReads = null;
  
  /** 
   * A list of all scheduled DOM write operations. Use head/tail to build the list. 
   * These operations must be executed in the bottom-up order.
  */
  final List<Function> domWrites = null;
  
    // TODO(misko/tobias): Do we actually need digest/flush pair? is Single WatchGroup enough?
  final WatchGroup watchGroupDigest = null;
  final WatchGroup watchGroupFlush = null;

}

ViewRef wrapView(View view) => null;


// TODO(misko): describe hydrate/de-hydrate process? or Reference it from here.
// TODO(misko): View needs to have ref to WatchGroup