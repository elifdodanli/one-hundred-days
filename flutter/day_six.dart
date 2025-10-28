// 1. Class Definition - The "Blueprint"
// This is the plan that defines what a Car should be.
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
}

