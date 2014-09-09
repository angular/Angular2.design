library angular.directive.proto_injector;

import "directive_injector.dart" show DirectiveInjector;
import "key_map.dart" show KeyMap;
import "../injector/injector.dart" show Injector;

class ProtoDirectiveInjector {
  Injector injector;
  KeyMap keyMap;
  /// Because DI tree is sparse, this shows how far away is the Parent DI
  int parentDistance = 1; /// 1 for non-sparse/normal depth.

  int cKey; Function cFactory; List<int> cParams;
  int keyId0; Function factory0; List<int> params0;
  int keyId1; Function factory1; List<int> params1;
  int keyId2; Function factory2; List<int> params2;
  int keyId3; Function factory3; List<int> params3;
  int keyId4; Function factory4; List<int> params4;
  int keyId5; Function factory5; List<int> params5;
  int keyId6; Function factory6; List<int> params6;
  int keyId7; Function factory7; List<int> params7;
  int keyId8; Function factory8; List<int> params8;
  int keyId9; Function factory9; List<int> params9;
  
  int queryKeyId0;
  int queryKeyId1;
  
  DirectiveInjector instantiate(DirectiveInjector parentDirectiveInjector) {
    return null;
  }
}