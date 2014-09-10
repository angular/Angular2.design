library example.tabs.app;

class Contact {
  String name;
  String text;
}

class TabsApp {
  List<Contact> contacts = <Contact>[];
  
  onContactSelection(Contact contact) {
    // Important that we get Contact here not some selection index.
    // We want our selection object not the selection object of the widget.
  }
}