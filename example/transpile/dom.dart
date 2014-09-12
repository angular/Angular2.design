library dom;

import 'dart:html';
export 'dart:html' show Element;

class DOM {
  static List<Element> query(String selector) => window.document.selectAll(selector);
  static innerHTML(Element element, String html) {
    element.innerHTML = html;
  }
}