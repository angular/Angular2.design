library angular.dom.view_impl;

import "dart:html" show Node;
import "view_factory.dart" show ViewFactory;
import "view_port.dart" show ViewPort;
import "directive_injector.dart" show DirectiveInjector;


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
 */
class View {
  /**
   * The view Factory which created this view and is responsible for caching these Views.
   */
  final ViewFactory viewFactory = null;

  /**
   * A set of DOM nodes which this [View] considers roots.
   */
  final List<Node> nodes = null;

  /**
   * If true than [View] is part of [ViewPort] if false than it is cached view ready for reuse.
   */
  bool isAttached;

  /**
   * If attached, than next/prev is used by [ViewPort] to keep a linked list of all [View]s.
   * If detached than next/prev is used by [ViewFactory] to keep a linked list of all cached
   * [View]s available for reuse.
   *
   * Attaching/detaching requires moving the View from one list to the other.
   */
  View nextView, prevView;
  
  /**
   * A [View] can have zero or mare [ViewPort]s. Use head/tail to keep track of the [ViewPort]s. 
   * The [ViewPort] list is fixed once the [View] is created.
   */
  final ViewPort headViewPort = null, tailViewPort = null;
  
  /**
   * A [View] has a depth-first liste of [DirectiveInjector]s which are used for
   * instantiating the Views.
   */
  final DirectiveInjector headDirectiveInjector = null, tailDirectiveInjector = null;
}
