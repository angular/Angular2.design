library angular.dom.view_port;

import "view.dart" show View;

/**
 * ViewPort is a place where a [View] can be inserted.
 * 
 * [View] and [ViewPort] together represent the only way a structure of the DOM can be modified.
 * NOTE: structure not attributes.
 * 
 * ViewPort is injected into Template directives such as [ng-repeat] and [ng-if] to alow these
 * directives to manipulet DOM structure by adding/removing Views.  
 */
class ViewPort extends LinkedList<View> {

    // Note: we don't use an array here / an index position as parameter as
    // we want to be fast in inserting / removing views out of the [ViewPort]
    View insert(View view, { View insertAfter }) {return null;}
    View move(View view, { View insertAfter }) {return null;}
    View remove(View view) {return null;}
}


