// Welcome to Day 8: Abstract Classes and Interfaces
// This file demonstrates how to use these concepts in Dart.

// ----------------------------------------
// 1. ABSTRACT CLASS
// ----------------------------------------

/// 📖 **Task:** Understand Abstract Classes
///
/// An `abstract class` is a blueprint for other classes.
/// You **cannot** create an instance of it directly.
/// Its purpose is to be extended (inherited) by other classes.
/// It's used to define common behaviors and properties that subclasses must have.
abstract class Animal {
  String name;

  // An abstract class can have a normal constructor
  Animal(this.name);

  // ----------------------------------------
  // 2. ABSTRACT METHOD
  // ----------------------------------------

  /// 📖 **Task:** Create an abstract method
  ///
  /// An `abstract method` is a method declaration without an
  /// implementation (no body, just a semicolon).
  ///
  /// Any regular (non-abstract) class that `extends` this abstract
  /// class MUST provide an implementation for this method.
  /// This enforces a "contract" for all subclasses.
  void makeSound();

  // Abstract classes can ALSO have normal (concrete) methods with a body.
  void eat() {
    print('$name is eating.');
  }
}

// ----------------------------------------
// 3. INTERFACE
// ----------------------------------------

/// 📖 **Task:** Understand Interfaces
///
/// In Dart, **any class** can be used as an interface.
/// An interface is just a "contract" of methods and properties.
/// When you `implement` an interface, you are promising
/// to provide your own version of ALL its methods and properties.
///
/// We often use an `abstract class` as an interface so it
/// can't be instantiated on its own.
abstract class CanFly {
  void fly();
}

// Another interface
abstract class CanSwim {
  void swim();
}

// ----------------------------------------
// 4. 'implements' KEYWORD
// ----------------------------------------

/// 📖 **Task:** Use the `implements` Keyword
///
/// `extends`: You "are a" type of that class (inheritance).
///            You get all the code from the parent.
///            You can only extend ONE class.
///
/// `implements`: You "can do" this (a contract).
///              You get NONE of the code, you must re-implement
///              ALL methods and properties from scratch.
///              You can implement MULTIPLE interfaces.

// --- Example 1: Dog ---
// A Dog "is an" Animal. It doesn't fly or swim.
// It uses `extends` to inherit from Animal.
class Dog extends Animal {
  // We must call the parent's constructor
  Dog(String name) : super(name);

  // We MUST provide an implementation for the abstract 'makeSound' method.
  @override
  void makeSound() {
    print('$name says: Woof! Woof!');
  }
}

// --- Example 2: Bird (CHANGED from Duck) ---
// A Bird "is an" Animal.
// It "can do" flying and swimming (like a duck).
// It `extends` one class and `implements` two interfaces.
class Bird extends Animal implements CanFly, CanSwim {
  Bird(String name) : super(name);

  // --- From Animal (abstract class) ---
  @override
  void makeSound() {
    // Woodstock is a bird, but doesn't "quack". Let's change this!
    print('$name chirps: Tweet! Tweet!');
  }

  // We also inherit the concrete 'eat()' method for free.

  // --- From CanFly (interface) ---
  // We MUST implement 'fly' because we promised to by
  // using `implements CanFly`.
  @override
  void fly() {
    print('$name is fluttering around!');
  }

  // --- From CanSwim (interface) ---
  // We MUST implement 'swim' because we promised to
  // using `implements CanSwim`.
  @override
  void swim() {
    print('$name is splashing in the birdbath.');
  }
}

// --- Example 3: Fish ---
// A Fish "is an" Animal.
// It "can do" swimming.
class Fish extends Animal implements CanSwim {
  Fish(String name) : super(name);

  // --- From Animal ---
  @override
  void makeSound() {
    print('$name says: Blub... blub...');
  }

  // --- From CanSwim ---
  @override
  void swim() {
    print('$name is swimming gracefully.');
  }
}

// --- Main function to run the code ---
void main() {
  print('--- Day 8: Abstract Classes and Interfaces ---');

  // ❌ This is an error, you can't instantiate an abstract class:
  // var myAnimal = Animal('Generic');

  // --- Dog Example (CHANGED to Snoopy) ---
  print('\n--- Dog (Snoopy) ---');
  Dog snoopy = Dog('Snoopy');
  snoopy.makeSound(); // Implemented method
  snoopy.eat(); // Inherited (concrete) method

  // --- Bird Example (CHANGED from Duck to Woodstock) ---
  print('\n--- Bird (Woodstock) ---');
  Bird woodstock = Bird('Woodstock');
  woodstock.makeSound(); // Implemented from Animal
  woodstock.eat(); // Inherited from Animal
  woodstock.fly(); // Implemented from CanFly
  woodstock.swim(); // Implemented from CanSwim

  // --- Fish Example ---
  print('\n--- Fish (Nemo) ---');
  Fish nemo = Fish('Nemo');
  nemo.makeSound(); // Implemented from Animal
  nemo.eat(); // Inherited from Animal
  nemo.swim(); // Implemented from CanSwim
  // nemo.fly(); // Error: 'fly' is not defined for Fish.

  // 💡 **What You'll Gain:** Writing flexible, decoupled code.
  // We can create a list that holds anything that "CanSwim".
  // The list doesn't care if it's a Bird or a Fish.
  // It only cares that it fulfills the "CanSwim" contract.
  print('\n--- Using Interfaces as Types (Updated List) ---');
  // UPDATED this list to use 'woodstock'
  List<CanSwim> swimmers = [woodstock, nemo];

  for (var creature in swimmers) {
    // We can only call methods from the `CanSwim` interface.
    creature.swim();
  }
}