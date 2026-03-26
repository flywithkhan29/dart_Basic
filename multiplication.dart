void main() {
  int number = 2;

  print("=== Multiplication Table of $number ===");

  for (int i = 1; i <= 10; i++) {
    print("$number x $i = ${number * i}");
  }
}
