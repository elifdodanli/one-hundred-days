import 'dart:async'; 

// --- CODE CHALLENGE 1: Fake API Fetch (Future) ---

/// Simulates fetching a user profile from a network API.
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

// --- CODE CHALLENGE 2: Countdown Stream ---

/// Returns a Stream<int> that emits numbers from 5 down to 1.
Stream<int> countdownStream() async* {
  print("Stream: Starting countdown...");
  
  for (int i = 5; i >= 1; i--) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
  print("Stream: Countdown finished.");
}

// --- CODE CHALLENGE 3: Combine them (Stream onDone triggers Future) ---

void main() async { 
  
  print("Main: Starting the program."); 
  Stream<int> counter = countdownStream();
  
  // Start listening to the stream.
  counter.listen(
    // 1. DATA Handler: Print the emitted count just as the number.
    (data) => print('$data'), 
    
    // 2. DONE Handler: Runs when the Stream finishes.
    onDone: () async { 
      print("\nCountdown finished. Fetching user profile...");
      
      // Await the Future to get the user data.
      Map<String, String> profile = await fetchUserProfile(); 
      
      // Print the final result in the format you provided earlier.
      print('Main: Received Profile: $profile');
      
      print("All tasks completed.");
    },
    
    // 3. ERROR Handler: If any error occurs.
    onError: (error) => print('Error: $error'),
  );
  
  await Future.delayed(Duration(seconds: 10)); 
  print("Main: Program completed."); 
}