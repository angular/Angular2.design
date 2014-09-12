import "_child.dart" deferred as child;

main() {
  var x = child.loadLibrary;
  x().then((_) => print(child.FOO));
  print('hello');
}