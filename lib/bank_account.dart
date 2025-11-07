abstract class BankAccount {
  // properties
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

  // getters and setters
  int get getAccNumber {
    return _accNumber;
  }

  set setAccNumber(int newAccNum) {
    _accNumber = newAccNum;
  }

  String get getAccHolderName {
    return _accHolderName;
  }

  set setAccHolderName(String newAccHolderName) {
    _accHolderName = newAccHolderName;
  }

  double get getBalance {
    return _balance;
  }

  set setBalance(double newBalance) {
    _balance = newBalance;
  }

  // behaviours
  void withdraw(double amount);
  void deposit(double amount);

  void displayInfo() {
    print(
      "Acc/ no: $_accNumber \n Acc/ Name: $_accHolderName \n Balance: $_balance",
    );
  }
}
