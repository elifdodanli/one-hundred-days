import 'dart:async';
import 'dart:math';

// ----------------------------------------------------------------------
// ASYNCHRONOUS HELPER FUNCTIONS (Simulate external services)
// ----------------------------------------------------------------------

// Simulates fetching a user ID. Can be set to fail.
Future<String> fetchUser(bool shouldSucceed) {
  return Future.delayed(Duration(milliseconds: 500), () {
    if (shouldSucceed) {
      print("  [Helper] User fetched successfully.");
      return "user-47";
    } else {
      // Intentionally throws an exception (simulating a 401 error)
      throw Exception("Authentication Failed! (Simulated Error)");
    }
  });
}

// Simulates fetching posts using the ID.
Future<List<String>> fetchPosts(String userId) {
  return Future.delayed(Duration(milliseconds: 700), () {
    print("  [Helper] Posts for $userId fetched.");
    return ['Post A', 'Post B', 'Post C'];
  });
}

// ----------------------------------------------------------------------
// SUCCESS SCENARIO FUNCTION
// ----------------------------------------------------------------------
Future<void> processDataSuccess() async {
  print("\n--- 🚀 Starting Success Scenario ---");
  try {
    // Task: Use await to get a Future's value
    String userId = await fetchUser(true); 

    print("  [Success] Received User ID: $userId");

    // Task: Use await to get a Future's value
    List<String> posts = await fetchPosts(userId);

    print("  [Success] Final result: Found ${posts.length} posts.");
    
  } catch (e) {
    // This should NOT run in this scenario
    print("  [Error] ❌ Unexpected Error: ${e.toString()}");
  } finally {
    print("--- 🧹 Cleanup complete for Success Scenario. ---");
  }
}

// ----------------------------------------------------------------------
// FAILURE SCENARIO FUNCTION
// ----------------------------------------------------------------------
Future<void> processDataFailing() async {
  print("\n--- 💥 Starting Failure Scenario (Try/Catch Test) ---");
  // Task: Handle errors with try/catch
  try {
    // Setting shouldSucceed to false forces the Future to throw an error.
    await fetchUser(false); 
    
    // This line should NOT be reached
    print("  [Success] This message should never appear."); 
    
  } catch (e) {
    // This catches the error cleanly.
    print("  [CATCH] 🚨 Successfully caught error: ${e.toString()}");
  } finally {
    print("--- 🧹 Cleanup complete for Failure Scenario. ---");
  }
}

// ----------------------------------------------------------------------
// MAIN FUNCTION (The Entry Point - Now Asynchronous)
// ----------------------------------------------------------------------
// To use 'await' inside main, the main function must be marked 'async'.
Future<void> main() async {
  print("=================================================");
  print("[Main Thread] UI is responsive while processing...");
  print("=================================================");

  // Await ensures the first scenario finishes completely before the second starts.
  await processDataSuccess();

  // Now that processDataSuccess is fully done, we start the next scenario.
  await processDataFailing();
  
  print("\n[Main Thread] ALL ASYNCHRONOUS TASKS ARE COMPLETE.");
}