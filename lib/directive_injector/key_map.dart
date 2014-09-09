library angular.directive_injector.key_map;

/// import "query.dart" show Query;
import "dart:collection" show HashMap;

/**
 * Creating Directives is a very common operation in Angular. The goal of DirectiveInjector is to
 * be extreamly fast in speed and efficient in memory.
 * 
 * # Use Cases
 * 
 * ## Injecting other Directives
 * 
 * A common use case is for a directive to inject another directive into itself.
 * 
 *     @Decorator(selector: '[ng-model]')
 *     class NgModel {}
 * 
 *     @Decorator(selctor: '[required]')
 *     class Required {
 *       Required(NgModel ngModel);
 *     }
 * 
 *     <input ng-model="..." required>
 * 
 * Often times the injection is in a form of an interface rather than concrete type.
 * 
 *     class Container {};
 * 
 *     @Decorator(selector: 'form')
 *     class Form implements Container {}
 * 
 *     @Decorator(selector: 'field-set')
 *     class FieldSet implements Container {
 *        FieldSet(@parent Container container)
 *     }
 * 
 *     @Decorator(selector: 'input')
 *     class Required {
 *       Required(@parent Container container);
 *     }
 * 
 *     <form>
 *       <field-set>
 *         <input>
 *       </field-set>
 *    </form>
 * 
 * 
 * 
 * 
 *    class Validator {}
 *    
 *    @Decorator(selector: '[required]')
 *    class Required implements Validator {}
 * 
 *     @Decorator(selector: '[ng-model]')
 *     class NgModel {
 *       NgModel(@self Query<Validator> validators) {}
 *     }
 * 
 *     <input ng-model="..." required>
 * 
 * 
 * Bitwise operators only work on 31 bits in JavaScript (The last bit is used internally by V8), 
 * so we have to fit. Let's assume that at any given time there can not be more than 16,384 
 * directive types declared in the system or 2^14. That should be enough :-)
 * 
 * We can than split a number into: 14 + 14 + 2 = 30 bits. This gives us:
 *   - 14 bits for type
 *   - 14 bits for interface
 *   - 2 bits for relationship flags (self, parent, ancestor).
 * 
 * Another choice is to treat interfaces as separate from Types, that way we could mark 
 * two interfacse
 *   - 2 bits for relationship flags (self, parent, ancestor).
 *   - 13 bits for type ->  8,192 types supported
 *   - 8 bits for interface 1 -> 256 interfaces supported
 *   - 8 bits for interface 2 -> 256 interfaces supported
 * 
 * A unique Key
 * 
 * # Reference
 * 
 *     MyClass(@TypeA a, TypeB b)
 * 
 *     [@self|@parent|@ancestor] Type<Parameter>
 *     [@child|@descendant] Query<Type>
 *     
 *   
 */
class KeyMap {
  static const int _TYPE_BITS_    = 14;
  static const int _TYPE_MASK_    = (2^(_TYPE_BITS_ + 1) - 1);
  static const int MASK_REL       = 0x03;
  static const int MAKS_TYPE      = _TYPE_MASK_ << 3;
  static const int MAKS_INTERFACE = _TYPE_MASK_ << (_TYPE_BITS_ + 3);

  static const int REL_SELF       = 0x00;
  static const int REL_PARENT     = 0x01;
  static const int REL_ANCESTOR   = 0x02;
  
  static int _nextId = 1;
  
  final List<Key> _keys = [null];
  final Map<Type, Key> _types = new HashMap();
  
  String debugString(int id) => null;
  int fromParamater(Relation relation, Type type) => null;
  int fromQueryParamater(Relation relation, Type type) => null;
  
}

class Key {
  final int id;
  final Type type;

  Key(this.id, this.type);
}

class Relation {}