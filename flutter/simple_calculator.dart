import 'dart:io';

void main() {
  stdout.write("Enter the first number: ");  
  String? input1 = stdin.readLineSync();
  double? number1 = double.tryParse(input1 ?? ""); 


  if (number1 == null) {
    print("Invalid input. That's not a number!");
    return; 
  }
  stdout.write("Enter an operator (+, -, *, /): ");
  String? operator = stdin.readLineSync();


  stdout.write("Enter the second number: "); 
  String? input2 = stdin.readLineSync();
  double? number2 = double.tryParse(input2 ?? "");

  if (number2 == null) {
    print("Invalid input. That's not a number!");
    return; 
  }

  double? result;

  switch (operator) {
    case '+':
      result = number1 + number2;
      break;
    case '-':
      result = number1 - number2;
      break;
    case '*':
      result = number1 * number2;
      break;
    case '/':
      if (number2 == 0) {
        print("Error: Division by zero is not allowed.");
        return; 
      }
      result = number1 / number2;
      break;
    default:
      print("Invalid operator. Please use one of +, -, *, /.");
      return; 
  }

  print("The result of $number1 $operator $number2 is: $result");
}