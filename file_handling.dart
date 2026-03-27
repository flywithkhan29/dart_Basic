import 'dart:io';

void main() {
  // ====== WRITING TO A FILE ======
  print("=== WRITING FILE ===\n");
  
  File reportFile = File('seller_report.txt');
  
  // Write content (overwrites if file exists)
  reportFile.writeAsStringSync(
    "SELLER REPORT\n"
    "Generated: ${DateTime.now()}\n"
    "─────────────────────────\n"
    "1. TechZone Pvt Ltd — Premium\n"
    "2. QuickMart — Standard\n"
    "3. NewShop — Conditional\n"
    "─────────────────────────\n"
    "Total: 3 sellers\n"
  );
  print("Report written to seller_report.txt");
  
  // ====== READING FROM A FILE ======
  print("\n=== READING FILE ===\n");
  
  String content = reportFile.readAsStringSync();
  print(content);
  
  // ====== APPENDING TO A FILE ======
  print("=== APPENDING ===\n");
  
  reportFile.writeAsStringSync(
    "4. FakeStore — Rejected\n",
    mode: FileMode.append,
  );
  print("Appended new seller to report");
  
  // Read again to see the change
  print("\n=== UPDATED REPORT ===\n");
  print(reportFile.readAsStringSync());
  
  // ====== CHECK IF FILE EXISTS ======
  print("=== FILE CHECK ===\n");
  print("seller_report.txt exists? ${reportFile.existsSync()}");
  print("fake_file.txt exists? ${File('fake_file.txt').existsSync()}");
  
  // ====== READING LINES ======
  print("\n=== READING LINE BY LINE ===\n");
  List<String> lines = reportFile.readAsLinesSync();
  for (int i = 0; i < lines.length; i++) {
    print("Line ${i + 1}: ${lines[i]}");
  }
  
  // Clean up
  reportFile.deleteSync();
  print("\nFile deleted. Clean workspace.");
}