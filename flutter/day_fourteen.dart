import 'dart:async'; // Required for Future.delayed and StreamSubscription

/// Task 1: Understanding the difference: 
/// Stream vs. Future.
/// This file focuses on Stream, a sequence of events over time.

// --- Task 2: Create a Stream (Asynchronous Generator) ---

/// A function that returns a Stream<String>. 
/// It uses 'async*' and 'yield' to emit multiple values asynchronously.
Stream<String> messageStream() async* {
  
  // 1. Emit the first event
  await Future.delayed(Duration(seconds: 1));
  yield "Event 1: Stream Started";
  
  // 2. Emit the second event
  await Future.delayed(Duration(seconds: 1));
  yield "Event 2: Data Arrived";
  
  // 3. Emit the third event (The one we will use to cancel the subscription)
  await Future.delayed(Duration(seconds: 1));
  yield "Event 3: The FINAL Event!";
  
  // 4. This event will NOT be received because the subscription is cancelled
  await Future.delayed(Duration(seconds: 1));
  yield "Event 4: Missed Event (Subscription Cancelled)"; 
}

// --- Task 3 & 4: Listen to and Manage a StreamSubscription ---

void main() async {
  print("--- Day 14: Introduction to Streams ---");
  
  // 1. Get the Stream object
  Stream<String> myMessages = messageStream();
  
  // Task 4: Declare the StreamSubscription outside the listen() method 
  // so we can reference it inside (to fix the scope error we saw earlier).
  late StreamSubscription<String> subscription;
  
  print("Main: Starting to listen to the stream now.");
  
  // Task 3: Use the listen() method to subscribe to the stream events.
  // The listen() method returns the StreamSubscription object.
  subscription = myMessages.listen(
    
    // The data handler: Called every time the stream emits a value (yields)
    (String data) {
      print("Listener (DATA): Received -> '$data'");
      
      // Task 4: Use the StreamSubscription to manage the flow.
      if (data.contains("FINAL")) {
        print("Listener (ACTION): Final event received. Cancelling subscription...");
        subscription.cancel(); // <--- Stop receiving future events
      }
    },
    
    // The error handler: Called if the stream emits an error event
    onError: (error) {
      print("Listener (ERROR): Something went wrong: $error");
    },
    
    // The done handler: Called when the stream closes naturally (e.g., when the async* function finishes)
    onDone: () {
      print("Listener (DONE): Stream is completely finished.");
    },
  );
  
  // Since Streams are asynchronous, the main function continues immediately.
  print("Main: Program continues execution while stream runs in the background.");
  
  // We use a long delay in main to ensure the stream has time to run and cancel itself.
  await Future.delayed(Duration(seconds: 6));
  print("Main: Finished waiting. Program exit.");
}

