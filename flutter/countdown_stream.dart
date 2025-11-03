// DAY 15 
// CODE CHALLENGE 2
// Countdown Stream: Write a function that returns a Stream that emits the numbers from 5 down to 1,
// with a 1-second delay between each number.

Stream<int> countdownStream() async* {
  print("Stream: Starting countdown...");
  
  // Loop from 5 down to 1
  for (int i = 5; i >= 1; i--) {
    
    // 1. Wait for 1 second before emitting
    await Future.delayed(Duration(seconds: 1)); 
    
    // 2. Send the current number to the stream
    yield i;
    
  }
  print("Stream: Countdown finished.");
}
void main() {
  print("Main: Starting the program.");
  
  Stream<int> counter = countdownStream();
  
  // 2. Listen to the stream and print the received data
  counter.listen((int data) {
    print('$data');
  });

}