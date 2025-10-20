void main() {
  // --- Understanding Null Safety by Default ---
  // In modern Dart, variables cannot be null unless you explicitly allow them to be.
  
  // String name = null; // ERROR: A value of type 'Null' can't be assigned to a variable of type 'String'.
  // int age;          // ERROR: Non-nullable variable 'age' must be assigned before it can be used.
  // print(age);

  
  // --- 1. Nullable Types: The '?' Operator ---
  // To declare a variable that can be null, add a '?' after its type.
  print('--- 1. Nullable Types ---');
  String? nullableName = null;
  print('nullableName is: $nullableName'); // Prints: nullableName is: null

  nullableName = 'Elif';
  print('nullableName is now: $nullableName'); // Prints: nullableName is now: Elif


  // --- 2. Null-aware Operators: '?.' and '??' ---
  print('\n--- 2. Null-aware Operators ---');
  
  // Example 1: Using the null-aware access operator '?.'
  String? potentialName; // This is null right now
  
  // If we try to access a property on a null value, we get an error.
  // int length = potentialName.length; // ERROR

  // The '?.' operator says: "If the variable is not null, get its length. Otherwise, the result is null."
  int? length = potentialName?.length; 
  print('Length of potentialName is: $length'); // Prints: Length of potentialName is: null
  
  // Example 2: Using the if-null operator '??' to provide a default value
  String? guestName = null;
  
  // The '??' operator says: "Use guestName if it's not null. Otherwise, use 'Guest'."
  String displayName = guestName ?? 'Guest';
  print('Display Name: $displayName'); // Prints: Display Name: Guest

  guestName = 'Max';
  displayName = guestName ?? 'Guest';
  print('Display Name is now: $displayName'); // Prints: Display Name is now: Kaan


  // --- 3. The '!' (Null Assertion) and 'late' Keywords ---
  print('\n--- 3. The `!` and `late` Keywords ---');

  // The '!' operator (null assertion or "bang" operator)
  // Use this when YOU are 100% sure a nullable variable is NOT null at that moment.
  // It's like telling the compiler: "Trust me, I know what I'm doing."
  // WARNING: If you are wrong, your app will crash!
  String? possiblyNullValue = 'I have a value';
  String nonNullValue = possiblyNullValue!; // You guarantee it's not null.
  print('Guaranteed value: $nonNullValue');

  // possiblyNullValue = null;
  // String riskyValue = possiblyNullValue!; // CRASH! This would throw an exception.


  // The 'late' keyword
  // Use this when you want to declare a non-nullable variable that you will
  // initialize LATER, but definitely before you use it for the first time.
  late String description;

  // ... imagine some complex logic or fetching data happens here ...
  
  // Now we initialize it.
  description = 'This description was initialized later.';
  
  // Now we can safely use it.
  print(description);

  // If you tried to print `description` before initializing it, your app would crash.
}

