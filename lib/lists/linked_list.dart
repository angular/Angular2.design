library angular.lists.linked_list;

class LinkedList<T> {
  LinkedListEntry<T> head, tail;
}

class LinkedListEntry<T> {
  T prev, next;
}