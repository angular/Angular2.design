library angular.annotations.visibility;

class Visibility {
  static const LOCAL = const Visibility._('LOCAL');
  static const CHILDREN = const Visibility._('CHILDREN');
  static const DIRECT_CHILD = const Visibility._('DIRECT_CHILD');

  final String name;
  const Visibility._(this.name);
  toString() => 'Visibility: $name';
}
