String getApprovalStatus(bool gst, int products, double rating, int years) {
  if (!gst) {
    return "REJECTED | Reason: GST verification is mandatory to sell on this platform.";
  } else if (rating < 3.0) {
    return "REJECTED | Reason: Seller rating is below the minimum threshold of 3.0.";
  } else if (products < 5) {
    return "REJECTED | Reason: Minimum 5 products required to be listed.";
  } else if (rating >= 4.5 && products >= 50 && years >= 3) {
    return "PREMIUM APPROVED | Perks: Priority listing, dedicated account manager, lower commission rate.";
  } else if (rating >= 3.5 && products >= 20 && years >= 1) {
    return "STANDARD APPROVED | Perks: Standard listing, access to promotional campaigns.";
  } else if (rating >= 3.0 && products >= 5) {
    String status = "CONDITIONALLY APPROVED";
    if (rating < 3.5) {
      status += "\n  Action : Improve your rating to 3.5+ within 60 days.";
    }
    if (products < 20) {
      status += "\n  Action : Add at least ${20 - products} more product(s) to unlock full features.";
    }
    if (years < 1) {
      status += "\n  Action : Account will be reviewed again after 1 year in business.";
    }
    return status;
  } else {
    return "REJECTED | Reason: Does not meet the minimum approval criteria.";
  }
}

void printSellerCard(String name, bool gst, int products, double rating, int years) {
  String status = getApprovalStatus(gst, products, rating, years);

  print("=============================");
  print("  SELLER APPROVAL SYSTEM");
  print("=============================");
  print("Seller      : $name");
  print("GST Verified: $gst");
  print("Products    : $products");
  print("Rating      : $rating / 5.0");
  print("Experience  : $years year(s)");
  print("-----------------------------");
  print("Status      : $status");
  print("=============================\n");
}

void main() {
  printSellerCard("TechZone Pvt Ltd", true, 85, 4.6, 4);
  printSellerCard("QuickMart", true, 30, 3.7, 2);
  printSellerCard("NewShop", true, 8, 3.1, 0);
  printSellerCard("FakeStore", false, 50, 4.0, 5);
  printSellerCard("TinyDeals", true, 3, 4.2, 1);
}
