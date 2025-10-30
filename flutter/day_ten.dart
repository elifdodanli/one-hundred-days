void main() {
  print("--- Day 10: Collection Data Structures ---");
  
  // ------------------------------------------------------------------
  // 1. LIST: An Ordered Collection (Your Top Foods List)
  // ------------------------------------------------------------------
  
  // Task: Create a List<String>
  List<String> favoriteFoods = ['Pasta', 'Margherita Pizza', 'Chicken Burrito', 'Nachos', 'Taco'];
  
  print("\n## 🍝 Favorite Foods List (List<String>)");
  
  // Access items by index (Task: Access items)
  print("-> Accessing the first item (Index 0): ${favoriteFoods[0]}");
  print("-> The third item (Index 2) is: ${favoriteFoods[2]}");
  
  // Add item (Task: Add items)
  favoriteFoods.add('Quesadilla');
  print("-> List after adding an item: $favoriteFoods");
  
  // Remove item (Task: Remove items)
  favoriteFoods.remove('Taco');
  print("-> List after removing 'Taco': $favoriteFoods");
  
  // Insert item (Advanced)
  favoriteFoods.insert(1, 'Lasagna'); 
  print("-> List after inserting 'Lasagna' at index 1: $favoriteFoods");

  // Task: Iterate over Collection (forEach loop)
  print("\n-> Iterating over the final Food List:");
  int index = 0;
  for (String food in favoriteFoods) {
    print("  #${index++}: $food");
  }

  // ------------------------------------------------------------------
  // 2. MAP: Key-Value Pairs (Cuisine/Flavor Profile Dictionary)
  // ------------------------------------------------------------------
  
  // Task: Create a Map (Key=String, Value=String)
  Map<String, String> cuisineProfiles = {
    'Pasta': 'Italian (Rich, Umami)',
    'Margherita Pizza': 'Italian (Simple, Fresh)',
    'Chicken Burrito': 'Mexican (Spicy, Earthy)',
    'Nachos': 'Mexican (Cheesy, Crunchy)',
  };
  
  print("\n## 🌶️ Cuisine Profiles Map (Map<String, String>)");
  
  // Access values by key (Task: Access values by key)
  String dish = 'Chicken Burrito';
  print("-> Profile for '$dish': ${cuisineProfiles[dish]}");
  
  // Update a value (Advanced)
  cuisineProfiles['Pasta'] = 'Italian (Very Cheesy)'; 
  print("-> Updated 'Pasta' profile: ${cuisineProfiles['Pasta']}");

  // Remove pair (Task: Remove pairs)
  cuisineProfiles.remove('Nachos');
  print("-> Map size after removing Nachos: ${cuisineProfiles.length}");

  // Task: Iterate over Collection (forEach method)
  print("\n-> Iterating over Map Key-Value Pairs:");
  cuisineProfiles.forEach((key, value) {
    print("  Dish: **$key** -> Profile: $value");
  });
  
  // Task: Iterate over KEYS only (Advanced)
  print("\n-> Iterating over Map Keys only (Cuisine Names):");
  for (String key in cuisineProfiles.keys) {
    print("  Key: $key");
  }
}