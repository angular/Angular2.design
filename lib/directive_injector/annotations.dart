library angular.directive_injector.annotations;

const children = const Relation('children');
const descendent = const Relation('descendent');
const parent = const Relation('parent');
const ancestor = const Relation('ancestor');

class Relation {
  final name;
  const Relation(this.name);
}