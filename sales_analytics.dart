// ── Data ────────────────────────────────────────────────────────────────────

const int target = 50000;

final List<Map<String, dynamic>> team = [
  {"name": "Ayesha Khan",    "sales": 72000},
  {"name": "Bilal Raza",     "sales": 45000},
  {"name": "Sara Ahmed",     "sales": 61000},
  {"name": "Usman Tariq",    "sales": 38000},
  {"name": "Hira Malik",     "sales": 55000},
  {"name": "Faisal Qureshi", "sales": 29000},
  {"name": "Zara Siddiqui",  "sales": 80000},
  {"name": "Omar Sheikh",    "sales": 50000},
];

// ── Functions ────────────────────────────────────────────────────────────────

int totalSales(List<Map<String, dynamic>> data) {
  return data.map((e) => e["sales"] as int).reduce((a, b) => a + b);
}

double averageSales(List<Map<String, dynamic>> data) {
  return totalSales(data) / data.length;
}

Map<String, dynamic> highestPerformer(List<Map<String, dynamic>> data) {
  return data.reduce((a, b) => a["sales"] >= b["sales"] ? a : b);
}

Map<String, dynamic> lowestPerformer(List<Map<String, dynamic>> data) {
  return data.reduce((a, b) => a["sales"] <= b["sales"] ? a : b);
}

List<Map<String, dynamic>> whoHitTarget(List<Map<String, dynamic>> data) {
  return data.where((e) => e["sales"] >= target).toList();
}

List<Map<String, dynamic>> whoMissedTarget(List<Map<String, dynamic>> data) {
  return data.where((e) => e["sales"] < target).toList();
}

List<Map<String, dynamic>> sortBysales(List<Map<String, dynamic>> data) {
  List<Map<String, dynamic>> sorted = List.from(data);
  sorted.sort((a, b) => b["sales"].compareTo(a["sales"]));
  return sorted;
}

// ── Display Helpers ──────────────────────────────────────────────────────────

void printDivider() => print("─" * 38);

void printRow(String name, int sales) {
  String status = sales >= target ? "✅" : "❌";
  print("  $status  ${name.padRight(18)} \$${sales.toString().padLeft(6)}");
}

// ── Main ─────────────────────────────────────────────────────────────────────

void main() {
  printDivider();
  print("       SALES ANALYTICS REPORT");
  print("       Target per person: \$$target");
  printDivider();

  // 1. Total & Average
  int total = totalSales(team);
  double avg  = averageSales(team);
  print("  Total Sales   : \$$total");
  print("  Average Sales : \$${avg.toStringAsFixed(0)}");
  printDivider();

  // 2. Highest & Lowest
  var best  = highestPerformer(team);
  var worst = lowestPerformer(team);
  print("  Highest Performer : ${best["name"]} (\$${best["sales"]})");
  print("  Lowest  Performer : ${worst["name"]} (\$${worst["sales"]})");
  printDivider();

  // 3. Target hit / missed
  var hit    = whoHitTarget(team);
  var missed = whoMissedTarget(team);
  print("  Hit Target    : ${hit.length} / ${team.length} members");
  print("  Missed Target : ${missed.length} / ${team.length} members");
  printDivider();

  // 4. Sorted leaderboard
  print("  LEADERBOARD (High → Low)");
  printDivider();
  List<Map<String, dynamic>> ranked = sortBysales(team);
  for (int i = 0; i < ranked.length; i++) {
    String rank = "  #${(i + 1).toString().padRight(2)}";
    print("$rank ${ranked[i]["name"].padRight(18)} \$${ranked[i]["sales"]}");
  }
  printDivider();

  // 5. Who hit / missed breakdown
  print("  HIT TARGET (${hit.length})");
  for (var s in hit)    printRow(s["name"], s["sales"]);
  print("  MISSED TARGET (${missed.length})");
  for (var s in missed) printRow(s["name"], s["sales"]);
  printDivider();
}
