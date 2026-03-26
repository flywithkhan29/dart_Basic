void main() {
  int rows = 6;

  // Pattern 1: Left-aligned triangle
  print("=== Pattern 1: Left Triangle ===");
  for (int i = 1; i <= rows; i++) {
    String row = "";
    for (int j = 1; j <= i; j++) {
      row += "* ";
    }
    print(row);
  }

  // Pattern 2: Right-aligned triangle
  print("\n=== Pattern 2: Right Triangle ===");
  for (int i = 1; i <= rows; i++) {
    String row = "";
    for (int j = rows; j > i; j--) {
      row += "  ";
    }
    for (int k = 1; k <= i; k++) {
      row += "* ";
    }
    print(row);
  }

  // Pattern 3: Pyramid
  print("\n=== Pattern 3: Pyramid ===");
  for (int i = 1; i <= rows; i++) {
    String row = "";
    for (int j = rows; j > i; j--) {
      row += " ";
    }
    for (int k = 1; k <= (2 * i - 1); k++) {
      row += "*";
    }
    print(row);
  }

  // Pattern 4: Inverted triangle
  print("\n=== Pattern 4: Inverted Triangle ===");
  for (int i = rows; i >= 1; i--) {
    String row = "";
    for (int j = 1; j <= i; j++) {
      row += "* ";
    }
    print(row);
  }

  // Pattern 5: Number triangle
  print("\n=== Pattern 5: Number Triangle ===");
  for (int i = 1; i <= rows; i++) {
    String row = "";
    for (int j = 1; j <= i; j++) {
      row += "$j ";
    }
    print(row);
  }
}
