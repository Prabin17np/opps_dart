import 'package:opps_dart/bank_account.dart';

class CheckingAccount extends BankAccount {
  final double overdraftFee = 35.0;

  CheckingAccount({
    required super.accNumber,
    required super.accHolderName,
    required super.balance,
  });

  @override
  void deposit(double amount) {
    if (amount <= 0) {
      print("Deposit amount must be positive!");
      return;
    }
    setBalance = getBalance + amount;
    print("Deposited \$${amount.toStringAsFixed(2)} successfully!");
  }

  @override
  void withdraw(double amount) {
    if (amount <= 0) {
      print("Withdrawal amount must be positive!");
      return;
    }

    setBalance = getBalance - amount;

    if (getBalance < 0) {
      setBalance = getBalance - overdraftFee;
      print("⚠️ Overdraft! \$35 fee charged.");
    }

    print("Withdrew \$${amount.toStringAsFixed(2)} successfully!");
  }

  // Checking account has no interest
}
