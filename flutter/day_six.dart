// --- SUPERCLASS (PARENT) ---
// This is the base class from Day 6.
// It has all the common properties and methods.
class Car {
  // --- Properties ---
  // This is the data that a Car object will hold.
  String color;
  String brand;
  int modelYear;
  bool isEngineOn = false; // A property to track the engine's state

  // --- Constructor ---
  // This is a special function that runs when 'new Car(...)' is called.
  // The 'this.variableName' syntax is the Dart short-way
  // to assign parameters directly to the object's properties.
  Car(this.color, this.brand, this.modelYear) {
    // We can also run extra logic inside the constructor.
    print('$modelYear $brand ($color) has been created!');
  }

  // --- Methods ---
  // These are the actions (functions) that a Car object can perform.
  
  void startEngine() {
    if (isEngineOn) {
      print('The $brand\'s engine is already running.');
    } else {
      isEngineOn = true;
      print('The $brand engine started! Vroom vroom...');
    }
  }

  void stopEngine() {
    if (!isEngineOn) {
      print('The engine is already off.');
    } else {
      isEngineOn = false;
      print('The $brand engine stopped.');
    }
  }

  void honk() {
    print('The $color $brand says: Beep beep!');
  }
} // End of the Car class


// --- NEW SUBCLASS (CHILD) #1 ---
// 'ElectricCar' is a special type of 'Car'.
// It uses the 'extends' keyword to inherit from 'Car'.
class ElectricCar extends Car {
  
  // 1. Add new properties that only ElectricCars have
  int batteryLevel;

  // 2. Create the child's constructor
  // It takes all the parent's required info, PLUS its own new info.
  ElectricCar(String color, String brand, int modelYear, this.batteryLevel)
      // 3. 'super(...)' passes the parent's info "up" to the Car(..) constructor.
      : super(color, brand, modelYear);
  
  // 4. Override a method from the parent
  // We want a different 'startEngine' behavior for an electric car.
  @override
  void startEngine() {
    if (isEngineOn) {
      print('The $brand\'s systems are already on.');
    } else {
      isEngineOn = true;
      print('... (systems online) ...'); // Silent start!
      print('The $brand is now silently running.');
    }
  }

  // 5. Add a new method that only ElectricCars have
  void charge() {
    batteryLevel = 100;
    print('The $brand is charging. Battery is at 100%.');
  }
} // End of the ElectricCar class


// --- NEW SUBCLASS (CHILD) #2 ---
// 'Truck' is another special type of 'Car'.
class Truck extends Car {
  
  // 1. Add a new property
  double towingCapacity; // in tons

  // 2. Create the constructor
  Truck(String color, String brand, int modelYear, this.towingCapacity)
      : super(color, brand, modelYear); // Pass info to parent

  // 3. Override a method
  @override
  void honk() {
    // Trucks have a louder honk!
    print('The $color $brand says: HOOOONK!');
  }

  // 4. Add a new method
  void haul() {
    print('The $brand is hauling with a capacity of $towingCapacity tons.');
  }
} // End of the Truck class


// --- Program Entry Point ---
void main() {
  print('--- Building a Muscle Car ---');
  // 1. Creating an Object (Instance)
  // We use the 'Car' blueprint (class) to create a 'muscleCar' object.
  // We pass the values to the constructor.
  Car muscleCar = Car('Black', 'Dodge', 1970);

  print('\n--- Building German Cars ---');
  // 2. Creating More Objects
  // Each object is independent of the others.
  Car germanCar1 = Car('Pink', 'Porsche', 2023);
  Car germanCar2 = Car('Cherry Red', 'BMW', 2024);
  
  print('\n--- Interacting with the Muscle Car ---');
  // Using the properties of the 'muscleCar' object
  print('My car: ${muscleCar.brand} (Year: ${muscleCar.modelYear})');
  // Calling the methods of the 'muscleCar' object
  muscleCar.honk();        // Output: The Black Dodge says: Beep beep!
  muscleCar.startEngine(); // Output: The Dodge engine started! Vroom vroom...

  print('\n--- Interacting with the German Cars ---');
  print('My Porsche: ${germanCar1.brand} (${germanCar1.color})');
  germanCar1.startEngine(); // Output: The Porsche engine started! Vroom vroom...

  print('My BMW: ${germanCar2.brand} (${germanCar2.color})');
  germanCar2.stopEngine();  // Output: The engine is already off.

  // --- NEW DAY 7 CODE ADDED BELOW ---
  
  print('\n--- Creating an Electric Car (Day 7) ---');
  // Create an 'ElectricCar' object.
  ElectricCar myTaycan = ElectricCar('Ice Grey', 'Porsche Taycan', 2024, 93);
  
  print('\n--- Creating a Truck (Day 7) ---');
  // Create a 'Truck' object.
  Truck myTruck = Truck('Black', 'Ford F-150', 2023, 5.5);

  print('\n--- Interacting with the Taycan (Day 7) ---');
  // 'honk' is INHERITED from Car
  myTaycan.honk();
  // 'startEngine' is OVERRIDDEN by ElectricCar
  myTaycan.startEngine();
  // 'charge' is a NEW method in ElectricCar
  myTaycan.charge();

  print('\n--- Interacting with the Truck (Day 7) ---');
  // 'startEngine' is INHERITED from Car
  myTruck.startEngine();
  // 'honk' is OVERRIDDEN by Truck
  myTruck.honk();
  // 'haul' is a NEW method in Truck
  myTruck.haul();
}


