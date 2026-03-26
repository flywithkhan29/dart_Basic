void main() {
  // ====== ARITHMETIC OPERATORS ======
  // Your Concentrix sales data
  int monthlySalesTarget = 100;
  int actualSales = 150;
  double commissionRate = 0.05;

  // Calculate
  int overTarget = actualSales - monthlySalesTarget;
  double commissionAmount = actualSales * commissionRate;
  double targetPercentage = (actualSales / monthlySalesTarget) * 100;
  int remainingDays = 30;
  int salesPerDay =
      actualSales ~/ remainingDays; // ~/ means divide and round down
  int remainder = actualSales % remainingDays; // % gives remainder

  print("=== SALES REPORT ===");
  print("Target: $monthlySalesTarget");
  print("Actual Sales: $actualSales");
  print("Over Target By: $overTarget");
  print("Commission: Rs $commissionAmount");
  print("Target Achievement: $targetPercentage%");
  print("Average Sales Per Day: $salesPerDay");
  print("Remainder: $remainder");

  // ====== COMPARISON OPERATORS ======
  print("\n=== PERFORMANCE CHECK ===");
  print("Hit target? ${actualSales >= monthlySalesTarget}");
  print("Exactly on target? ${actualSales == monthlySalesTarget}");
  print("Below target? ${actualSales < monthlySalesTarget}");
  print("Over 140? ${actualSales > 140}");
  print("Not equal to 100? ${actualSales != 100}");

  // ====== LOGICAL OPERATORS ======
  bool isVerified = true;
  bool hasMinProducts = true;
  int productCount = 47;

  // AND (&&) - BOTH must be true
  bool canGetPremium = isVerified && hasMinProducts;
  print("\n=== SELLER STATUS ===");
  print("Eligible for Premium? $canGetPremium");

  // OR (||) - At least ONE must be true
  bool needsReview = !isVerified || productCount < 10;
  print("Needs Review? $needsReview");

  // NOT (!) - Flips true to false, false to true
  print("Is NOT verified? ${!isVerified}");



  // =============================
  // 📘 BCA Study Journey Calculator
  // =============================

  // --- Given Values ---
  int hoursPerDay = 7;
  int daysPerWeek = 6;
  int weeksPerMonth = 4;
  int totalCourseWeeks = 96;
  int completedWeeks = 2;

  // --- 1. Weekly & Monthly Study Hours ---
  int hoursPerWeek = hoursPerDay * daysPerWeek;
  int hoursPerMonth = hoursPerWeek * weeksPerMonth;

  print('========================================');
  print('   📊 BCA STUDY JOURNEY - MATH BREAKDOWN');
  print('========================================\n');

  print('1️⃣  Weekly & Monthly Hours');
  print('   Hours per day       : $hoursPerDay');
  print('   Study days per week : $daysPerWeek');
  print('   Hours per WEEK      : $hoursPerDay x $daysPerWeek = $hoursPerWeek hours');
  print('   Hours per MONTH     : $hoursPerWeek x $weeksPerMonth = $hoursPerMonth hours\n');

  // --- 2. Total Hours for Entire BCA Journey ---
  int totalHours = hoursPerWeek * totalCourseWeeks;

  print('2️⃣  Total Hours for Entire BCA Journey');
  print('   Total weeks in roadmap : $totalCourseWeeks weeks');
  print('   Total study hours      : $hoursPerWeek x $totalCourseWeeks = $totalHours hours\n');

  // --- 3. Percentage of Journey Completed ---
  double percentageCompleted = (completedWeeks / totalCourseWeeks) * 100;

  print('3️⃣  Journey Completed So Far');
  print('   Completed weeks : $completedWeeks');
  print('   Total weeks     : $totalCourseWeeks');
  print('   Percentage      : ($completedWeeks / $totalCourseWeeks) x 100 = ${percentageCompleted.toStringAsFixed(2)}%\n');

  // --- 4. Check: More than 5% completed? ---
  double threshold = 5.0;
  bool isMoreThan5 = percentageCompleted > threshold;
  double weeksNeededFor5 = (threshold / 100) * totalCourseWeeks;

  print('4️⃣  Have you completed more than 5%?');
  print('   ${percentageCompleted.toStringAsFixed(2)}% ${isMoreThan5 ? ">" : "<"} $threshold%');
  print('   Answer: ${isMoreThan5 ? "✅ YES" : "❌ NO"}');
  if (!isMoreThan5) {
    print('   You need to complete ${weeksNeededFor5.toStringAsFixed(1)} weeks to reach 5%.\n');
  }

  print('========================================');
  print('   💪 Keep going! $totalHours hours of');
  print('   learning awaits you!');
  print('========================================');
}