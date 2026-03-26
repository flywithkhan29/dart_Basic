void main() {
  // ====== IF / ELSE — Basic Decisions ======
  
  int sellerProducts = 47;
  double sellerRating = 4.5;
  bool hasGST = true;
  
  // Simple if/else
  if (sellerProducts >= 10) {
    print("Seller has enough products to be listed");
  } else {
    print("Seller needs more products");
  }
  
  // if / else if / else — Multiple conditions
  if (sellerRating >= 4.5) {
    print("⭐ Premium Seller");
  } else if (sellerRating >= 3.5) {
    print("✅ Good Seller");
  } else if (sellerRating >= 2.0) {
    print("⚠️ Average Seller - Needs Improvement");
  } else {
    print("❌ Poor Rating - Under Review");
  }
  
  // Combined conditions with && and ||
  if (hasGST && sellerProducts >= 10 && sellerRating >= 3.0) {
    print("✅ APPROVED for Flipkart marketplace");
  } else {
    print("❌ REJECTED - Requirements not met");
  }
  
  // ====== NESTED IF — Decisions inside decisions ======
  
  String sellerType = "electronics";
  int salesCount = 200;
  
  if (salesCount > 100) {
    print("\nHigh volume seller detected!");
    if (sellerType == "electronics") {
      print("Assigning to Electronics Premium Team");
    } else if (sellerType == "fashion") {
      print("Assigning to Fashion Premium Team");
    } else {
      print("Assigning to General Premium Team");
    }
  } else {
    print("\nRegular seller - Standard processing");
  }
  
  // ====== TERNARY OPERATOR — One-line if/else ======
  
  String status = sellerRating >= 4.0 ? "Active" : "Under Review";
  print("\nSeller Status: $status");
  
  // ====== SWITCH/CASE — When you have many specific options ======
  
  String department = "sales";
  
  switch (department) {
    case "sales":
      print("\n📞 Route to Sales Team");
      break;
    case "tech":
      print("\n💻 Route to Tech Support");
      break;
    case "billing":
      print("\n💰 Route to Billing Department");
      break;
    default:
      print("\n📋 Route to General Support");
  }
}