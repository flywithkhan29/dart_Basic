void main() {
  List<String> sellerNames = [
    "TechZone Pvt Ltd",
    "Priya Fashion Hub",
    "Ahmed Spices Co",
    "Sneha Books Store",
    "Vikram Tools",
    "Rahul Electronics",
    "Meera Handicrafts",
    "Global Gadgets",
  ];

  List<double> ratings = [4.8, 3.6, 2.8, 4.1, 3.0, 4.5, 1.9, 3.9];

  int approved = 0;
  int rejected = 0;

  print("==========================================");
  print("        BATCH SELLER APPROVAL SYSTEM      ");
  print("==========================================");

  for (int i = 0; i < sellerNames.length; i++) {
    String name = sellerNames[i];
    double rating = ratings[i];
    String status;

    if (rating >= 4.5) {
      status = "⭐ PREMIUM APPROVED";
      approved++;
    } else if (rating >= 3.5) {
      status = "✅ STANDARD APPROVED";
      approved++;
    } else if (rating >= 3.0) {
      status = "⚠️  CONDITIONALLY APPROVED";
      approved++;
    } else {
      status = "❌ REJECTED";
      rejected++;
    }

    print("${i + 1}. ${name.padRight(22)} | Rating: $rating | $status");
  }

  print("==========================================");
  print("               SUMMARY                   ");
  print("==========================================");
  print("Total Sellers : ${sellerNames.length}");
  print("✅ Approved   : $approved");
  print("❌ Rejected   : $rejected");
  print("==========================================");
}
