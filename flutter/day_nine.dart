// main() is the entry point for our Dart program.
void main() {
  print("--- 🦸 Batman: The World's Greatest Detective ---");
  var batman = Batman();
  batman.run();      // From his base class: Human
  batman.grapple();  // From 'TechGadgeteer' Mixin
  batman.fight();    // From 'SkilledFighter' Mixin (common ability)

  print("\n--- 🕷️ Spider-Man: Friendly Neighborhood Web-Slinger ---");
  var spiderMan = SpiderMan();
  spiderMan.run();     // From his base class: Human
  spiderMan.wallCrawl(); // From 'Superhuman' Mixin
  spiderMan.fight();   // From 'SkilledFighter' Mixin (common ability)

  print("\n--- 🌙 Moon Knight: The Fist of Khonshu ---");
  var moonKnight = MoonKnight();
  moonKnight.run();     // From his base class: Human
  moonKnight.fight();   // From 'SkilledFighter' Mixin (common ability)
  moonKnight.grapple(); // From 'TechGadgeteer' Mixin (similar to Batman!)
  
  // Demonstrating the 'unrelated class' power:
  print("\n--- Code Reuse Proof ---");
  print("Batman and Moon Knight both have the 'grapple' skill:");
  batman.grapple();
  moonKnight.grapple();
}


/*
======================================================================
 Task 1: Understand Mixins (vs. Inheritance)
----------------------------------------------------------------------
 INHERITANCE: Defines the core identity ("IS A" relationship)
 A hero IS A Human.
======================================================================
*/

// The base class (The parent) - Every hero extends this class.
// A class can only EXTEUND ONE class.
class Human {
  void run() {
    print("Running on two feet.");
  }
}

/*
======================================================================
 Task 2: Create a `mixin`
----------------------------------------------------------------------
 MIXIN: Defines reusable functionality/skills ("HAS A" relationship)
 Mixins provide the actual code for the methods.
======================================================================
*/

// MIXIN 1: Skill gained through training/tools (Tech Gadgeteer)
mixin TechGadgeteer {
  void grapple() {
    print("Ziiiip! Deployed grappling hook.");
  }
}

// MIXIN 2: Skill gained through superhuman abilities (Powers)
mixin Superhuman {
  void wallCrawl() {
    print("Sticking to the wall using superhuman grip.");
  }
}

// MIXIN 3: A common, shared skill for many classes (Fighter)
// This is the classic mixin use-case: sharing common behavior.
mixin SkilledFighter {
  void fight() {
    print("Performing advanced martial arts maneuvers!");
  }
}


/*
======================================================================
 Task 3 & 4: Use the `with` Keyword & Explore Use Cases
----------------------------------------------------------------------
 USE CASE: Share abilities among UNRELATED classes (or classes with 
 a common but shallow parent like 'Human').
======================================================================
*/

// BATMAN
// Extends Human (is a Human)
// WITH two mixins (has the skills)
class Batman extends Human with SkilledFighter, TechGadgeteer {
  // Batman has no unique methods/properties here; he's pure mixin and inheritance composition.
}

// SPIDER-MAN
// Extends Human (is a Human)
// WITH different mixins - The key is that he shares 'SkilledFighter' with Batman!
class SpiderMan extends Human with SkilledFighter, Superhuman {
  // Spider-Man has a unique skill, but it's not a mixin (for demonstration):
  void senseDanger() {
    print("My Spider-Sense is tingling!");
  }
}

// MOON KNIGHT
// Extends Human (is a Human)
// WITH a mix of mixins, including one shared with Batman.
class MoonKnight extends Human with SkilledFighter, TechGadgeteer {
  // Moon Knight's unique method overrides a mixin property for a unique twist
  // Mixins can interact with the class that uses them.
  @override
  void fight() {
    print("Fighting with brutal Khonshu force! (Used the SkilledFighter skill)");
  }
}