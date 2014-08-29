library angular.dom.view_port;

import "view.dart" show View;

/**
 * ViewPort is a place where a [View] can be inserted.
 * 
 * [View] and [ViewPort] together represent the only way a structure of the DOM can be modified.
 * NOTE: structure not attributes.
 */
class ViewPort {
    /**
     * Head and tail of the views associated with this [ViewPort]
     */
    View _headView, _tailView;
    
    View insert(View view, { View insertAfter }) {return null;}
    View move(View view, { View insertAfter }) {return null;}
    View remove(View view) {return null;}
}


