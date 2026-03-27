// abstract = Cannot be created directly, only extended
abstract class PaymentMethod {
  String holderName;
  double balance;
  
  PaymentMethod({required this.holderName, required this.balance});
  
  // Abstract method — no body, MUST be implemented by children
  // Every payment method processes differently
  bool processPayment(double amount);
  
  // Regular method — shared by all children
  String getBalanceDisplay() {
    return "Rs ${balance.toStringAsFixed(2)}";
  }
  
  void printDetails();
}

class UPI extends PaymentMethod {
  String upiId;
  
  UPI({
    required super.holderName,
    required super.balance,
    required this.upiId,
  });
  
  @override
  bool processPayment(double amount) {
    if (amount > balance) {
      print("❌ UPI Payment failed — Insufficient balance");
      return false;
    }
    balance -= amount;
    print("✅ Rs $amount paid via UPI ($upiId)");
    return true;
  }
  
  @override
  void printDetails() {
    print("UPI | $holderName | ID: $upiId | Balance: ${getBalanceDisplay()}");
  }
}

class CreditCard extends PaymentMethod {
  String cardNumber;
  double creditLimit;
  
  CreditCard({
    required super.holderName,
    required super.balance,
    required this.cardNumber,
    required this.creditLimit,
  });
  
  String get maskedNumber => "XXXX-XXXX-XXXX-${cardNumber.substring(cardNumber.length - 4)}";
  
  @override
  bool processPayment(double amount) {
    if (amount > creditLimit) {
      print("❌ Card declined — Exceeds credit limit");
      return false;
    }
    creditLimit -= amount;
    print("✅ Rs $amount charged to card $maskedNumber");
    return true;
  }
  
  @override
  void printDetails() {
    print("Card | $holderName | $maskedNumber | Limit: Rs ${creditLimit.toStringAsFixed(0)}");
  }
}

class BankTransfer extends PaymentMethod {
  String accountNumber;
  String ifscCode;
  
  BankTransfer({
    required super.holderName,
    required super.balance,
    required this.accountNumber,
    required this.ifscCode,
  });
  
  @override
  bool processPayment(double amount) {
    if (amount > balance) {
      print("❌ Transfer failed — Insufficient funds");
      return false;
    }
    balance -= amount;
    print("✅ Rs $amount transferred via NEFT (IFSC: $ifscCode)");
    return true;
  }
  
  @override
  void printDetails() {
    print("Bank | $holderName | A/C: $accountNumber | Balance: ${getBalanceDisplay()}");
  }
}

void main() {
  // This would cause an ERROR if uncommented:
  // PaymentMethod p = PaymentMethod(holderName: "Test", balance: 100);
  // ^ Cannot instantiate abstract class!
  
  List<PaymentMethod> wallet = [
    UPI(holderName: "Saad Khan", balance: 5000, upiId: "saad@upi"),
    CreditCard(
      holderName: "Saad Khan",
      balance: 0,
      cardNumber: "4532015112830366",
      creditLimit: 50000,
    ),
    BankTransfer(
      holderName: "Saad Khan",
      balance: 25000,
      accountNumber: "1234567890",
      ifscCode: "HDFC0001234",
    ),
  ];
  
  print("=== SAAD'S DIGITAL WALLET ===\n");
  for (var method in wallet) {
    method.printDetails();
  }
  
  print("\n=== PROCESSING PAYMENTS ===\n");
  
  // Pay for different things using different methods
  wallet[0].processPayment(500);   // UPI for small payment
  wallet[1].processPayment(15000); // Card for medium payment  
  wallet[2].processPayment(8000);  // Bank for large payment
  wallet[0].processPayment(10000); // UPI fails — not enough balance
  
  print("\n=== UPDATED BALANCES ===\n");
  for (var method in wallet) {
    method.printDetails();
  }
}