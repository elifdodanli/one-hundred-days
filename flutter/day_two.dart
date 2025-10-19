void main() {
  // --- 1. if/else Statements ---
  // These are used to make decisions in your code.

  print('--- 1. if / else Statements ---');
  int score = 85;

  // The condition inside the parentheses `(score > 80)` is evaluated.
  // If it's `true`, the code inside the `{}` block runs.
  if (score > 80) {
    print('Great score! You passed with distinction.');
  } 
  // If the first condition is `false`, the `else if` condition is checked.
  else if (score >= 60) {
    print('Good job. You passed.');
  } 
  // If all of the above conditions are `false`, the `else` block runs.
  else {
    print('You need to study more. You failed.');
  }


  // --- 2. for Loops ---
  // These are used to repeat a block of code a specific number of times.

  print('\n--- 2. for Loops ---');
  // This is a classic 'for' loop that counts from 0 up to (but not including) 5.
  // It has three parts, separated by semicolons:
  // 1. Initialization: `int i = 0` (runs once at the beginning)
  // 2. Condition: `i < 5` (checked before each loop)
  // 3. Action: `i++` (runs at the end of each loop)
  for (int i = 0; i < 5; i++) {
    print('The current number is: $i');
  }

  // A more modern and readable way to loop through a collection is a 'for-in' loop.
  print('\nLooping through a list of things to learn:');
  var learningTopics = ['robotics', 'mobile app development', 'productivity tools'];
  for (var learningTopic in learningTopics) {
    print('I like to learn about $learningTopic.');
  }


  // --- 3. while and do-while Loops ---
  // These loops continue as long as a condition is true.
  // BE CAREFUL: If the condition never becomes false, you create an infinite loop!

  print('\n--- 3. while and do-while Loops ---');
  
  // 'while' loop: Checks the condition BEFORE running the code.
  int countdown = 3;
  print('While loop countdown:');
  while (countdown > 0) {
    print(countdown);
    countdown--; // This is the same as `countdown = countdown - 1;`
  }
  print('kachow!');

  // 'do-while' loop: Runs the code ONCE, then checks the condition.
  // This guarantees the code block runs at least one time.
  int number = 5;
  print('\nDo-while loop example:');
  do {
    print('This number is $number'); // This line will run once.
    number++;
  } while (number < 5); // The condition `5 < 5` is false, so the loop stops.


  // --- 4. switch/case Statements ---
  // This is useful when you have one variable and want to do different things
  // based on its specific value. It can be cleaner than a long `if/else if` chain.
  
  print('\n--- 4. switch/case Statements ---');
  var command = 'OPEN';

  switch (command) {
    case 'OPEN':
      print('The system is now open.');
      break; // The 'break' keyword is important to exit the switch statement.

    case 'CLOSED':
      print('The system is closed. Please try again later.');
      break;

    case 'PENDING':
      print('The system is pending. Please wait.');
      break;

    // The 'default' case runs if none of the other cases match.
    default:
      print('Unknown command.');
  }
}
