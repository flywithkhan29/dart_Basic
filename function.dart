// ====== BASIC FUNCTION — No input, no output ======
void greet() {
  print("Welcome to Seller Management System v2.0");
  print("==========================================");
}

// ====== FUNCTION WITH PARAMETERS — Takes input ======
void greetSeller(String sellerName) {
  print("Hello, $sellerName! Welcome to our platform.");
}

// ====== FUNCTION WITH RETURN VALUE — Gives back a result ======
String getSellerStatus(double rating) {
  if (rating >= 4.5) {
    return "⭐ Premium";
  } else if (rating >= 3.5) {
    return "✅ Standard";
  } else if (rating >= 3.0) {
    return "⚠️ Conditional";
  } else {
    return "❌ Rejected";
  }
}

// ====== FUNCTION WITH MULTIPLE PARAMETERS ======
double calculateCommission(int sales, double rate) {
  return sales * rate;
}

// ====== FUNCTION THAT RETURNS A BOOL (yes/no answer) ======
bool isEligible(bool hasGST, int productCount, double rating) {
  return hasGST && productCount >= 10 && rating >= 3.0;
}

// ====== NAMED PARAMETERS — Cleaner function calls ======
void printSellerReport({
  required String name,
  required double rating,
  required int products,
  int yearsInBusiness = 0, // Default value
}) {
  print("Seller: $name");
  print("Rating: $rating | Products: $products | Years: $yearsInBusiness");
  print("Status: ${getSellerStatus(rating)}");
  print("---");
}

// ====== MAIN — Where the program starts ======
void main() {
  // Call the simple function
  greet();
  
  // Call with parameter
  greetSeller("TechZone Pvt Ltd");
  greetSeller("Priya Fashion Hub");
  
  // Use return value
  String status = getSellerStatus(4.7);
  print("\nSeller rating 4.7 is: $status");
  
  // Calculate commission
  double commission = calculateCommission(150, 0.05);
  print("Commission on 150 sales at 5%: Rs $commission");
  
  // Check eligibility
  bool eligible = isEligible(true, 47, 4.5);
  print("Eligible for platform? $eligible");
  
  // Named parameters — notice how readable this is
  print("\n=== SELLER REPORTS ===");
  printSellerReport(
    name: "TechZone Pvt Ltd",
    rating: 4.8,
    products: 85,
    yearsInBusiness: 4,
  );
  
  printSellerReport(
    name: "New Start Shop",
    rating: 3.1,
    products: 8,
    // yearsInBusiness not provided — defaults to 0
  );
  
  // ====== USING FUNCTIONS IN A LOOP — The real power ======
  print("\n=== BATCH PROCESSING WITH FUNCTIONS ===");
  List<String> names = ["Rahul", "Priya", "Ahmed", "Sneha"];
  List<double> ratings = [4.6, 3.2, 4.9, 2.8];
  
  int approved = 0;
  int rejected = 0;
  
  for (int i = 0; i < names.length; i++) {
    String status = getSellerStatus(ratings[i]);
    print("${names[i]}: $status");
    
    if (isEligible(true, 20, ratings[i])) {
      approved++;
    } else {
      rejected++;
    }
  }
  
  print("\nApproved: $approved | Rejected: $rejected");
}