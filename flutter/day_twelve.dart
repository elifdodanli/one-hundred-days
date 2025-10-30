import 'dart:async';
import 'dart:math';

void main() {
  print("--- Future Callback Demo ---");

  // Run the asynchronous simulation
  simulateDataFetch(shouldSucceed: Random().nextBool());
}

Future<String> simulateDataFetch({required bool shouldSucceed}) {
  print("\n[Start] Request initiated...");
  
  // 1. Create a Future that delays for 1.5 seconds.
  return Future.delayed(Duration(milliseconds: 1500), () {
    if (shouldSucceed) {
      // Future completes with a successful VALUE
      return "SUCCESS! User profile data received.";
    } else {
      // Future completes with an ERROR
      throw Exception("ERROR: Server timed out or network disconnected.");
    }
  })
  
  // -------------------------------------------------------------
  // 2. .then() - Executes ONLY on success (VALUE)
  // -------------------------------------------------------------
  .then((data) {
    print("[.then()] ✅ Success: Processing received data...");
    print("[Result] Data: $data");
    // .then() can return a new Future or value, allowing chaining.
    return 'Data Processed';
  }) 
  
  // -------------------------------------------------------------
  // 3. .catchError() - Executes ONLY on failure (ERROR)
  // -------------------------------------------------------------
  .catchError((error) {
    print("[.catchError()] ❌ Failure: Displaying error message.");
    print("[Error] Message: ${error.toString()}");
    // .catchError() allows the chain to continue safely, potentially recovering.
    return 'Error Handled'; // Returns a value so the subsequent chain doesn't break
  })
  
  // -------------------------------------------------------------
  // 4. .whenComplete() - Executes ALWAYS (Cleanup)
  // -------------------------------------------------------------
  .whenComplete(() {
    print("\n[.whenComplete()] 🧹 Cleanup: Hiding loading spinner and logging end.");
  });
}