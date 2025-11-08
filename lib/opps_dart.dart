// Abstract class for common bank account features
abstract class BankAccount {
  int _accNo;
  String _accHolder;
  double _balance;

  List transactionHistory = [];

  // Constructor to initialize account holder, number, and balance
  BankAccount(this._accHolder, this._accNo, this._balance);

  void withdraw(double amount);

  void deposit(double amount);

  // Getter and setter for account number
  int get getAccountNumber {
    return _accNo;
  }

  set setAccountNumber(int newNumber) {
    _accNo = newNumber;
  }

  String get getAccountHolder {
    return _accHolder;
  }

  set setAccountHolder(String newHolder) {
    _accHolder = newHolder;
  }

  double get getBalance {
    return _balance;
  }

  set setBalance(double newBalance) {
    _balance = newBalance;
  }

  void displayTransactionHistory();
}

// Interface for accounts that can calculate interest
abstract class InterestBearing {
  double calculateAnnualInterest();
  double calculateMonthlyInterest();
}

// Savings account class that supports interest calculation
class SavingAccount extends BankAccount implements InterestBearing {
  int withdrawalTime = 0;

  // Constructor with minimum balance validation
  SavingAccount(super._accHolder, super._accNo, super._balance) {
    if (_balance < 500) {
      print("Minimum balance for saving account must be 500");
      super._balance = 0;
      return;
    }
  }

  @override
  void deposit(double amount) {
    super.setBalance = _balance + amount;
    super.transactionHistory.add({"action": "Deposit", "amount": amount});
  }

  @override
  void withdraw(double amount) {
    if (withdrawalTime == 3) {
      print("You have reached your withdrawal limit for month");
    } else {
      if (_balance - amount < 500) {
        print("The balance cannot exceed minimum requirement which is 500");
        return;
      } else {
        super.setBalance = _balance - amount;
        withdrawalTime++;
        super.transactionHistory.add({"action": "Withdraw", "amount": amount});
      }
    }
  }

  @override
  double calculateAnnualInterest() {
    return 0.02 * 12 * getBalance;
  }

  @override
  double calculateMonthlyInterest() {
    return 0.02 * getBalance;
  }

  @override
  void displayTransactionHistory() {
    for (var detail in super.transactionHistory) {
      print(detail);
    }
  }
}

// Checking account class with overdraft feature
class CheckingAccount extends BankAccount {
  static int overdraft = 35;

  CheckingAccount(super._accHolder, super._accNo, super._balance);

  @override
  void deposit(double amount) {
    super.setBalance = _balance + amount;
    super.transactionHistory.add({"action": "Deposit", "amount": amount});
  }

  @override
  void withdraw(double amount) {
    if (_balance - amount < 0) {
      super.setBalance = _balance - (amount + overdraft);
      print("Balanced below 0 -> overdraft added");
    } else {
      super.setBalance = _balance - (amount + overdraft);
    }
    super.transactionHistory.add({"action": "Withdraw", "amount": amount});
  }

  @override
  void displayTransactionHistory() {
    for (var detail in super.transactionHistory) {
      print(detail);
    }
  }
}

// Premium account class with higher minimum balance and interest
class PremiumAccount extends BankAccount implements InterestBearing {
  PremiumAccount(super._accHolder, super._accNo, super._balance) {
    if (_balance < 10000) {
      print("Minimum balance for premium account must be 10000");
      super._balance = 0;
    }
  }

  @override
  void deposit(double amount) {
    super.setBalance = _balance + amount;
    super.transactionHistory.add({"action": "Deposit", "amount": amount});
  }

  @override
  void withdraw(double amount) {
    if (_balance - amount < 10000) {
      print("The balance cannot exceed minimum requirement which is 10000");
      return;
    }
    super.setBalance = _balance - amount;
    super.transactionHistory.add({"action": "Withdraw", "amount": amount});
  }

  @override
  double calculateAnnualInterest() {
    return 0.05 * 12 * getBalance;
  }

  @override
  double calculateMonthlyInterest() {
    return 0.05 * getBalance;
  }

  @override
  void displayTransactionHistory() {
    for (var detail in super.transactionHistory) {
      print(detail);
    }
  }
}

// Student account with a limit on balance
class StudentAccount extends BankAccount {
  static final limit = 5000;
  StudentAccount(super.accHolder, super.accNo, super.balance);

  @override
  void deposit(double amount) {
    if (_balance + amount > limit) {
      print("Maximum limit is $limit");
      print("Can not deposit");
      return;
    }
    super.setBalance = _balance + amount;
    super.transactionHistory.add({"action": "Deposit", "amount": amount});
  }

  @override
  void withdraw(double amount) {
    if (_balance - amount < 0) {
      print("The balance cannot exceed minimum requirement which is 0");
      return;
    }
    super.setBalance = _balance - amount;
    super.transactionHistory.add({"action": "Withdraw", "amount": amount});
  }

  @override
  void displayTransactionHistory() {
    for (var detail in super.transactionHistory) {
      print(detail);
    }
  }
}
