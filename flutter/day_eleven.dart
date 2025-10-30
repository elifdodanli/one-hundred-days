import 'dart:async';

void main() {
  print("=================================================");
  print("START: Day 11 Asynchronous Programming Demo");
  print("=================================================");
  
  // -----------------------------------------------------------------
  // 1. SYNCHRONOUS CODE (The Main Thread's Immediate Work)
  // This code runs in strict, predictable sequence.
  // -----------------------------------------------------------------
  print("\n[Thread 1] ➡️  1A. Synchronous Task: Started user login process.");

  // Calling the function starts the async operation immediately.
  // The function returns a Future object, and the Main Thread moves on.
  Future<String> dataFuture = fetchUserData();

  print("[Thread 1] ➡️  1B. Synchronous Task: Finished sending login request (Received Future object).");
  print("             The Main Thread is now FREE and moving to the next line.");
  
  // -----------------------------------------------------------------
  // 2. OTHER SYNCHRONOUS WORK (The UI Remaining Responsive)
  // This code runs immediately AFTER the Future is returned,
  // proving that the Main Thread did NOT wait for the data.
  // -----------------------------------------------------------------
  print("\n[Thread 1] ➡️  2A. Synchronous Task: Drawing UI elements.");
  
  // A small loop to simulate quick, sequential work that blocks until finished.
  for (int i = 0; i < 3; i++) {
    print("             ... Drawing element $i completed.");
  }
  
  print("[Thread 1] ➡️  2B. ALL SYNCHRONOUS CODE IS DONE.");
  print("=================================================");
  print("[Event Loop] 🔄 Waiting for the 2-second delay to finish...");
  
  // -----------------------------------------------------------------
  // 3. ASYNCHRONOUS COMPLETION (The Event Loop's Delivery)
  // This code will only run after the delay AND after all synchronous code above has finished.
  // We use .then() to process the Future's eventual result.
  // -----------------------------------------------------------------
  dataFuture.then((data) {
    print("\n[Event Loop] 🛎️  3A. Future completed! Delivery to Main Thread.");
    print("[Thread 1] 🟢 3B. Handled Data: '$data'");
  });
  
  print("=================================================");
  print("END: Main function finished executing. Now waiting for Events.");
}

// -----------------------------------------------------------------
// FUTURE FUNCTION DEFINITION
// A function that returns a Future (a promise of a value later).
// This is where the long-running, non-blocking work is defined.
// -----------------------------------------------------------------
Future<String> fetchUserData() {
  // Future.delayed simulates a long operation, like a network request.
  // The Main Thread returns IMMEDIATELY after calling this function.
  print("[Background] ⏳ Long operation (2 seconds) STARTED.");
  return Future.delayed(Duration(seconds: 2), () {
    // This code runs in the background. Once the delay is over, 
    // the result ('User Data Fetched') is placed on the Event Queue.
    print("[Background] ✅ Long operation finished.");
    return "User Data Fetched Successfully!";
  });
}

/*
EXPECTED EXECUTION FLOW (Illustrating the Event Loop):
1.  Code 1A runs.
2.  fetchUserData() is called, prints 'Long operation STARTED', and immediately returns a Future object.
3.  Code 1B runs (proves it didn't wait 2 seconds).
4.  Code 2A and the loop run immediately.
5.  Code 2B runs. ALL synchronous code is finished.
6.  The Event Loop takes over. It checks the Event Queue.
7.  (2-second pause) The Future completes in the background. Its result is placed on the Event Queue.
8.  The Event Loop detects the completed task and runs the .then() block (Code 3A and 3B).
*/