void main() {
  // ====== FOR LOOP — When you know how many times ======
  
  // Process 5 sellers
  print("=== PROCESSING SELLERS ===");
  for (int i = 1; i <= 5; i++) {
    print("Processing seller #$i...");
  }
  
  // ====== FOR LOOP with a List ======
  
  List<String> sellers = ["Rahul Electronics", "Priya Fashion", "Ahmed Spices", "Sneha Books", "Vikram Tools"];
  
  print("\n=== SELLER DIRECTORY ===");
  for (int i = 0; i < sellers.length; i++) {
    print("${i + 1}. ${sellers[i]}");
  }
  
  // ====== FOR-IN LOOP — Cleaner way to go through a list ======
  
  print("\n=== RATINGS CHECK ===");
  List<double> ratings = [4.5, 3.2, 4.8, 2.9, 3.7];
  
  for (double rating in ratings) {
    if (rating >= 4.0) {
      print("Rating $rating → ⭐ Premium");
    } else if (rating >= 3.0) {
      print("Rating $rating → ✅ Standard");
    } else {
      print("Rating $rating → ❌ Below Minimum");
    }
  }
  
  // ====== WHILE LOOP — When you don't know how many times ======
  
  print("\n=== DAILY TARGET TRACKER ===");
  int dailyTarget = 10;
  int salesMade = 0;
  
  while (salesMade < dailyTarget) {
    salesMade += 2; // Made 2 sales in this round
    print("Sales so far: $salesMade / $dailyTarget");
  }
  print("🎯 Daily target reached!");
  
  // ====== DO-WHILE — Runs at least once ======
  
  print("\n=== SYSTEM CHECK ===");
  int attempts = 0;
  bool systemReady = false;
  
  do {
    attempts++;
    print("Attempt $attempts: Checking system...");
    if (attempts >= 3) {
      systemReady = true;
    }
  } while (!systemReady);
  print("✅ System ready after $attempts attempts");
  
  // ====== BREAK and CONTINUE ======
  
  print("\n=== FINDING FIRST PREMIUM SELLER ===");
  List<double> allRatings = [3.2, 3.8, 4.6, 4.9, 3.1];
  
  for (int i = 0; i < allRatings.length; i++) {
    if (allRatings[i] < 4.0) {
      continue; // Skip non-premium, go to next
    }
    print("Found premium seller at position ${i + 1} with rating ${allRatings[i]}");
    break; // Stop searching, we found one
  }
}
