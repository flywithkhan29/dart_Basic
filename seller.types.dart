  // Flipkart Seller Hierarchy
// Base class for all seller types

// ============== BASE CLASS ==============
class Seller {
  String name;
  String gstNumber;
  double rating;
  bool isVerified;

  // Constructor
  Seller({
    required this.name,
    required this.gstNumber,
    required this.rating,
    required this.isVerified,
  });

  // Get seller status based on verification and rating
  String getStatus() {
    if (!isVerified) {
      return "Unverified";
    }
    if (rating >= 4.5) {
      return "Premium";
    } else if (rating >= 4.0) {
      return "Good";
    } else if (rating >= 3.0) {
      return "Average";
    }
    return "Poor";
  }

  // Print seller information
  void printInfo() {
    print('═' * 60);
    print('Seller Information:');
    print('  Name: $name');
    print('  GST Number: $gstNumber');
    print('  Rating: ⭐ $rating');
    print('  Verification Status: ${isVerified ? "✓ Verified" : "✗ Unverified"}');
    print('  Seller Status: ${getStatus()}');
    print('═' * 60);
  }
}

// ============== CHILD CLASS 1: INDIVIDUAL SELLER ==============
class IndividualSeller extends Seller {
  String ownerName;
  String phoneNumber;

  // Constructor
  IndividualSeller({
    required String name,
    required String gstNumber,
    required double rating,
    required bool isVerified,
    required this.ownerName,
    required this.phoneNumber,
  }) : super(
    name: name,
    gstNumber: gstNumber,
    rating: rating,
    isVerified: isVerified,
  );

  // Override printInfo to include owner details
  @override
  void printInfo() {
    print('═' * 60);
    print('📱 INDIVIDUAL SELLER PROFILE');
    print('═' * 60);
    print('  Store Name: $name');
    print('  Owner Name: $ownerName');
    print('  Phone Number: $phoneNumber');
    print('  GST Number: $gstNumber');
    print('  Rating: ⭐ $rating');
    print('  Verification Status: ${isVerified ? "✓ Verified" : "✗ Unverified"}');
    print('  Seller Status: ${getStatus()}');
    print('═' * 60);
  }
}

// ============== CHILD CLASS 2: BUSINESS SELLER ==============
class BusinessSeller extends Seller {
  String companyRegNumber;
  int employeeCount;
  double annualRevenue; // in rupees

  // Constructor
  BusinessSeller({
    required String name,
    required String gstNumber,
    required double rating,
    required bool isVerified,
    required this.companyRegNumber,
    required this.employeeCount,
    required this.annualRevenue,
  }) : super(
    name: name,
    gstNumber: gstNumber,
    rating: rating,
    isVerified: isVerified,
  );

  // Get business tier based on annual revenue
  // 1 crore = 10,000,000 rupees
  // 10 lakh = 1,000,000 rupees
  String getBusinessTier() {
    if (annualRevenue > 10000000) {
      return "Enterprise";
    } else if (annualRevenue > 1000000) {
      return "Mid-size";
    }
    return "Small";
  }

  // Helper method to format currency
  String _formatCurrency(double amount) {
    if (amount >= 10000000) {
      return "₹${(amount / 10000000).toStringAsFixed(2)} Cr";
    } else if (amount >= 100000) {
      return "₹${(amount / 100000).toStringAsFixed(2)} Lakh";
    }
    return "₹${amount.toStringAsFixed(0)}";
  }

  // Override printInfo to include business details
  @override
  void printInfo() {
    print('═' * 60);
    print('🏢 BUSINESS SELLER PROFILE');
    print('═' * 60);
    print('  Company Name: $name');
    print('  Company Reg Number: $companyRegNumber');
    print('  GST Number: $gstNumber');
    print('  Employee Count: $employeeCount');
    print('  Annual Revenue: ${_formatCurrency(annualRevenue)}');
    print('  Business Tier: ${getBusinessTier()}');
    print('  Rating: ⭐ $rating');
    print('  Verification Status: ${isVerified ? "✓ Verified" : "✗ Unverified"}');
    print('  Seller Status: ${getStatus()}');
    print('═' * 60);
  }
}

// ============== CHILD CLASS 3: PREMIUM SELLER ==============
class PremiumSeller extends BusinessSeller {
  String accountManager;
  int priorityLevel; // 1-5, where 5 is highest

  // Constructor
  PremiumSeller({
    required String name,
    required String gstNumber,
    required double rating,
    required bool isVerified,
    required String companyRegNumber,
    required int employeeCount,
    required double annualRevenue,
    required this.accountManager,
    required this.priorityLevel,
  }) : super(
    name: name,
    gstNumber: gstNumber,
    rating: rating,
    isVerified: isVerified,
    companyRegNumber: companyRegNumber,
    employeeCount: employeeCount,
    annualRevenue: annualRevenue,
  ) {
    // Validate priority level
    if (priorityLevel < 1 || priorityLevel > 5) {
      throw ArgumentError('Priority level must be between 1 and 5');
    }
  }

  // Helper method to display priority with stars
  String _getPriorityDisplay() {
    return '⭐' * priorityLevel + '☆' * (5 - priorityLevel);
  }

  // Override printInfo to show everything including priority
  @override
  void printInfo() {
    print('═' * 60);
    print('👑 PREMIUM SELLER PROFILE');
    print('═' * 60);
    print('  Company Name: $name');
    print('  Account Manager: $accountManager');
    print('  Priority Level: ${_getPriorityDisplay()} ($priorityLevel/5)');
    print('  Company Reg Number: $companyRegNumber');
    print('  GST Number: $gstNumber');
    print('  Employee Count: $employeeCount');
    print('  Annual Revenue: ${_formatCurrency(annualRevenue)}');
    print('  Business Tier: ${getBusinessTier()}');
    print('  Rating: ⭐ $rating');
    print('  Verification Status: ${isVerified ? "✓ Verified" : "✗ Unverified"}');
    print('  Seller Status: ${getStatus()}');
    print('═' * 60);
  }
}

// ============== MAIN FUNCTION ==============
void main() {
  print('\n');
  print('╔' + '═' * 58 + '╗');
  print('║' + ' ' * 58 + '║');
  print('║' + '  FLIPKART SELLER HIERARCHY MANAGEMENT SYSTEM  '.padRight(58) + '║');
  print('║' + ' ' * 58 + '║');
  print('╚' + '═' * 58 + '╝');
  print('\n');

  // Create 2 Individual Sellers
  final IndividualSeller seller1 = IndividualSeller(
    name: 'TechHub Store',
    gstNumber: '18AABCR5055K1Z0',
    rating: 4.7,
    isVerified: true,
    ownerName: 'Rajesh Kumar',
    phoneNumber: '+91-9876543210',
  );

  final IndividualSeller seller2 = IndividualSeller(
    name: 'Fashion Paradise',
    gstNumber: '27AABCU9603R1Z5',
    rating: 3.8,
    isVerified: true,
    ownerName: 'Priya Sharma',
    phoneNumber: '+91-9123456789',
  );

  // Create 2 Business Sellers
  final BusinessSeller seller3 = BusinessSeller(
    name: 'ElectroWorld Corporation',
    gstNumber: '18AADCR5055K2Z1',
    rating: 4.4,
    isVerified: true,
    companyRegNumber: 'CIN U52699MH2019PTC339822',
    employeeCount: 45,
    annualRevenue: 5000000, // 50 Lakh
  );

  final BusinessSeller seller4 = BusinessSeller(
    name: 'Premium Goods Ltd',
    gstNumber: '27AABCT1234R2Z9',
    rating: 4.6,
    isVerified: true,
    companyRegNumber: 'CIN U72999DL2018PTC340456',
    employeeCount: 120,
    annualRevenue: 15000000, // 1.5 Crore
  );

  // Create 2 Premium Sellers
  final PremiumSeller seller5 = PremiumSeller(
    name: 'MegaTrade Solutions',
    gstNumber: '10AABCS5678K3Z2',
    rating: 4.9,
    isVerified: true,
    companyRegNumber: 'CIN U45678DL2015PTC390123',
    employeeCount: 250,
    annualRevenue: 50000000, // 5 Crore
    accountManager: 'Vikram Singh',
    priorityLevel: 5,
  );

  final PremiumSeller seller6 = PremiumSeller(
    name: 'Global Exports Inc',
    gstNumber: '05AABCE9012K4Z7',
    rating: 4.8,
    isVerified: true,
    companyRegNumber: 'CIN U92234MH2016PTC301789',
    employeeCount: 180,
    annualRevenue: 30000000, // 3 Crore
    accountManager: 'Anjali Patel',
    priorityLevel: 4,
  );

  // Store all sellers in a List<Seller> (demonstrating polymorphism)
  final List<Seller> allSellers = [
    seller1,
    seller2,
    seller3,
    seller4,
    seller5,
    seller6,
  ];

  // Loop through and call printInfo() on each seller
  print('📊 DISPLAYING ALL SELLERS USING POLYMORPHISM:\n');
  for (int i = 0; i < allSellers.length; i++) {
    print('Seller ${i + 1}/${allSellers.length}:');
    allSellers[i].printInfo();
    print('\n');
  }

  // Additional demonstration: Show seller count by type
  print('📈 SUMMARY STATISTICS:\n');
  int individualCount = allSellers.whereType<IndividualSeller>().length;
  int businessCount = allSellers.whereType<BusinessSeller>().length -
      allSellers.whereType<PremiumSeller>().length;
  int premiumCount = allSellers.whereType<PremiumSeller>().length;

  print('  Total Sellers: ${allSellers.length}');
  print('  Individual Sellers: $individualCount');
  print('  Business Sellers: $businessCount');
  print('  Premium Sellers: $premiumCount');
  print('\n');

  // Show average rating
  double averageRating =
      allSellers.fold(0.0, (sum, seller) => sum + seller.rating) /
          allSellers.length;
  print('  Average Rating: ⭐ ${averageRating.toStringAsFixed(2)}');
  print('\n');
}