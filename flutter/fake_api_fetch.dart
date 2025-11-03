// DAY 15 - CODE CHALLENGE 1
//  Write a function that returns a Future that completes with a fake user profile (e.g., a Map with a name and email) after a 2-second delay.
// Use async/await to call this function and print the user profile.
Future<Map<String, String>> fetchUserProfile() async {
  print("API: Starting user data fetch (simulating 2-second delay)...");
  await Future.delayed(Duration(seconds: 2));
  print("API: Data successfully retrieved.");
  return {
    'name': 'Elif',
    'email': 'elif@example.com',
    'role': 'Engineer'
  };
}

void main() async {
  print("Main: Starting the program.");
  
  // 1. Call the asynchronous function and await its result
  Map<String, String> profile = await fetchUserProfile(); 
  
  // 2. Print the received data
  print('Main: Received Profile: $profile');

  print("Main: Program completed.");
}