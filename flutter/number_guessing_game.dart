import 'dart:io';
import 'dart:math';

void main() {
  // --- Step 1: Generate a Random Number ---
  final random = Random();
  // Generate a random integer between 1 and 100 (inclusive).
  // random.nextInt(100) generates from 0 to 99, so we add 1.
  final int correctNumber = random.nextInt(100) + 1;
  
  print('--- Simple Number Guessing Game ---');
  print('I have selected a number between 1 and 100.');

  // --- Step 2: Start the Game Loop ---
  // This `while (true)` loop will run forever until we explicitly `break` it.
  while (true) {
    // --- Step 3: Get User Input ---
    // `stdout.write` prints a message without adding a new line at the end.
    stdout.write('Please enter your guess: ');

    // Read the line of text the user enters. It might be null.
    final String? input = stdin.readLineSync();
    
    // --- Step 4: Validate and Parse the Input ---
    // Check if the input is null (e.g., user pressed Ctrl+D).
    if (input == null) {
      print('No input received. Exiting game.');
      break;
    }

    // Use `int.tryParse` to convert the String to an integer.
    // If the input is not a valid number (like "abc"), it will return null.
    // This is safer than `int.parse()`, which would crash the program.
    final int? guess = int.tryParse(input);

    if (guess == null) {
      print('Invalid input. Please enter a number.');
      // `continue` skips the rest of the current loop iteration and starts the next one.
      continue; 
    }
    
    // --- Step 5: Compare the Guess and Give Feedback ---
    if (guess < correctNumber) {
      print('Too low, try again!');
    } else if (guess > correctNumber) {
      print('Too high, try again!');
    } else {
      // If the guess is not lower or higher, it must be correct.
      print('You got it! The number was $correctNumber.');
      // `break` exits the `while` loop, ending the game.
      break; 
    }
  }
}

