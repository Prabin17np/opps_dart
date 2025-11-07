// 1️ Abstract class (Abstraction)
abstract class BankAccount {
  int _accNumber;
  String _accHolderName;
  double _balance;

  // constructor
  BankAccount({
    required int accNumber,
    required String accHolderName,
    required double balance,
  }) : _accNumber = accNumber,
       _accHolderName = accHolderName,
       _balance = balance;

  // getters
  int get getAccNumber => _accNumber;
  String get getAccHolderName => _accHolderName;
  double get getBalance => _balance;

  set setAccHolderName(String newName) => _accHolderName = newName;
  set setBalance(double newBalance) => _balance = newBalance;

  // abstract methods
  void withdraw(double amount);
  void deposit(double amount);

  void displayInfo() {
    print("\nAccount No: $_accNumber");
    print("Holder Name: $_accHolderName");
    print("Balance: \$$_balance");
  }
}
