void main() {
  // Seller Profile Variables
  String sellerName = "TechZone Pvt Ltd";
  bool gstVerified = true;
  int productCount = 85;
  double rating = 4.6;
  int yearsInBusiness = 4;

  print("=============================");
  print("  SELLER APPROVAL SYSTEM");
  print("=============================");
  print("Seller      : $sellerName");
  print("GST Verified: $gstVerified");
  print("Products    : $productCount");
  print("Rating      : $rating / 5.0");
  print("Experience  : $yearsInBusiness year(s)");
  print("-----------------------------");

  // Approval Logic
  if (!gstVerified) {
    // Hard reject — GST is mandatory
    print("Status :  REJECTED");
    print("Reason : GST verification is mandatory to sell on this platform.");
  } else if (rating < 3.0) {
    // Hard reject — too low rating
    print("Status :  REJECTED");
    print("Reason : Seller rating is below the minimum threshold of 3.0.");
  } else if (productCount < 5) {
    // Hard reject — insufficient inventory
    print("Status :  REJECTED");
    print("Reason : Minimum 5 products required to be listed.");
  } else if (gstVerified && rating >= 4.5 && productCount >= 50 && yearsInBusiness >= 3) {
    // Top tier seller
    print("Status : ⭐ PREMIUM APPROVED");
    print("Perks  : Priority listing, dedicated account manager, lower commission rate.");
  } else if (gstVerified && rating >= 3.5 && productCount >= 20 && yearsInBusiness >= 1) {
    // Solid seller
    print("Status : ✅ STANDARD APPROVED");
    print("Perks  : Standard listing, access to promotional campaigns.");
  } else if (gstVerified && rating >= 3.0 && productCount >= 5) {
    // Meets minimum but needs improvement
    print("Status : ⚠️  CONDITIONALLY APPROVED");

    if (rating < 3.5) {
      print("Action : Improve your rating to 3.5+ within 60 days to maintain approval.");
    }
    if (productCount < 20) {
      print("Action : Add at least ${20 - productCount} more product(s) to unlock full features.");
    }
    if (yearsInBusiness < 1) {
      print("Action : Account will be reviewed again after 1 year in business.");
    }
  } else {
    print("Status : ❌ REJECTED");
    print("Reason : Does not meet the minimum approval criteria.");
  }

  print("=============================");
} 
