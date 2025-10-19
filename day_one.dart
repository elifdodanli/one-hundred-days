void main() {
  // --- Task 2: Hello, World! ---
  print('Hello, World!');
  // --- Task 3: Variable Declaration ---
  
  // Using 'var': Dart infers the type is a String.
  var greeting = 'Hello Elif!';
  
  // Print the value of the 'greeting' variable.
  print(greeting);

  // Using 'final': This value cannot be changed after it's set.
  final int startDay = 1;
  // We use $variable (String Interpolation) to insert a variable into a String.
  print('Today is Day $startDay of the roadmap.');
  // startDay = 2; // This would cause an ERROR, because 'final' can't be reassigned.

  // Using 'const': This value is a compile-time constant.
  const bool isLearning = true;


  // --- Task 4: Core Data Types ---
  
  int myAge = 22;       // An integer (whole number)
  double myHeight = 1.55; // A double (floating-point number)
  String myMajor = 'Math';  // A String (text)

  // Printing all the variables:
  print('My age is: $myAge');
  print('My height is: $myHeight');
  print('My major is: $myMajor');
 
  print('Am I currently learning?');
  if (isLearning) {
    print('Yes, absolutely!');
  } 
}