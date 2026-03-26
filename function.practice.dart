void introduce(String name, String company) {
  print("Hi, I am $name from $company.");
}

double monthlySalary(int hoursPerDay, int daysWorked, double hourlyRate) {
  return hoursPerDay * daysWorked * hourlyRate;
}

bool isTargetAchieved(int target, int actual) {
  return actual >= target;
}

void main() {
  // Function 1: introduce
  introduce("Ali", "Google");
  introduce("Sara", "Meta");

  // Function 2: monthlySalary
  double salary1 = monthlySalary(8, 22, 15.0);
  print("Monthly Salary (8hrs, 22 days, \$15/hr): \$$salary1");

  double salary2 = monthlySalary(6, 26, 20.5);
  print("Monthly Salary (6hrs, 26 days, \$20.5/hr): \$$salary2");

  // Function 3: isTargetAchieved
  bool result1 = isTargetAchieved(100, 120);
  print("Target 100, Actual 120 → Achieved: $result1");

  bool result2 = isTargetAchieved(200, 180);
  print("Target 200, Actual 180 → Achieved: $result2");
}
