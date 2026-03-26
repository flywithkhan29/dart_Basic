class Employee {
  String name;
  String department;
  double monthlySales;
  double targetAmount;
  int joiningYear;

  Employee({
    required this.name,
    required this.department,
    required this.monthlySales,
    required this.targetAmount,
    required this.joiningYear,
  });

  // Returns how much % of target was achieved
  double achievementPercentage() {
    return (monthlySales / targetAmount) * 100;
  }

  // Returns grade based on achievement %
  String getPerformanceGrade() {
    double pct = achievementPercentage();
    if (pct >= 120) return "A+";
    if (pct >= 100) return "B";
    if (pct >= 80)  return "C";
    return "D";
  }

  // Eligible if grade is B or above AND has at least 2 years of experience
  bool isEligibleForPromotion() {
    int yearsOfService = 2026 - joiningYear;
    String grade = getPerformanceGrade();
    return (grade == "A+" || grade == "B") && yearsOfService >= 2;
  }

  void printReport() {
    double pct          = achievementPercentage();
    String grade        = getPerformanceGrade();
    bool promotion      = isEligibleForPromotion();
    int yearsOfService  = 2026 - joiningYear;

    print("╔══════════════════════════════════════╗");
    print("║         EMPLOYEE REPORT CARD         ║");
    print("╠══════════════════════════════════════╣");
    print("  Name         : $name");
    print("  Department   : $department");
    print("  Joined       : $joiningYear  ($yearsOfService yr(s) of service)");
    print("──────────────────────────────────────");
    print("  Target        : \$${targetAmount.toStringAsFixed(0)}");
    print("  Monthly Sales : \$${monthlySales.toStringAsFixed(0)}");
    print("  Achievement   : ${pct.toStringAsFixed(1)}%");
    print("──────────────────────────────────────");
    print("  Grade         : $grade");
    print("  Promotion     : ${promotion ? "✅ Eligible" : "❌ Not Eligible"}");
    print("╚══════════════════════════════════════╝\n");
  }
}

void main() {
  List<Employee> employees = [
    Employee(
      name: "Zara Siddiqui",
      department: "Sales",
      monthlySales: 72000,
      targetAmount: 60000,
      joiningYear: 2021,
    ),
    Employee(
      name: "Bilal Raza",
      department: "Marketing",
      monthlySales: 45000,
      targetAmount: 50000,
      joiningYear: 2023,
    ),
    Employee(
      name: "Ayesha Khan",
      department: "Sales",
      monthlySales: 58000,
      targetAmount: 60000,
      joiningYear: 2020,
    ),
    Employee(
      name: "Usman Tariq",
      department: "Operations",
      monthlySales: 30000,
      targetAmount: 50000,
      joiningYear: 2024,
    ),
  ];

  for (var emp in employees) {
    emp.printReport();
  }
}
