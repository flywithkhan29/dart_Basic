double add(double a, double b) {
  return a + b;
}

double subtract(double a, double b) {
  return a - b;
}

double multiply(double a, double b) {
  return a * b;
}

double? divide(double a, double b) {
  if (b == 0) {
    print("Error: Cannot divide by zero.");
    return null;
  }
  return a / b;
}

void main() {
  print("===== CALCULATOR =====\n");

  print("-- Addition --");
  print("10 + 5  = ${add(10, 5)}");
  print("3.5 + 2.5 = ${add(3.5, 2.5)}\n");

  print("-- Subtraction --");
  print("10 - 4  = ${subtract(10, 4)}");
  print("7.5 - 3.0 = ${subtract(7.5, 3.0)}\n");

  print("-- Multiplication --");
  print("6 x 7   = ${multiply(6, 7)}");
  print("2.5 x 4 = ${multiply(2.5, 4)}\n");

  print("-- Division --");
  print("20 / 4  = ${divide(20, 4)}");
  print("9 / 0   = ${divide(9, 0)}");
  print("7.5 / 2.5 = ${divide(7.5, 2.5)}");
}
