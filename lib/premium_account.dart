import 'package:opps_dart/bank_account.dart';

class PremiumAccount extends BankAccount {
  final double minBalance = 10000;

  PremiumAccount({
    required super.accNumber,
    required super.accHolderName,
    required super.balance,
  });

  @override
  void deposit(double amount) {
    setBalance = getBalance + amount;
    print("Deposited \$${amount.toStringAsFixed(2)} successfully!");
  }

  @override
  void withdraw(double amount) {
    if (amount <= 0) {
      print("Withdrawal amount must be positive!");
      return;
    }

    if (getBalance - amount < minBalance) {
      print(" Cannot withdraw. Must maintain minimum balance of \$10,000.");
      return;
    }

    setBalance = getBalance - amount;
    print("Withdrew \$${amount.toStringAsFixed(2)} successfully!");
  }

  double interestCalculation(double time) {
    // Simple interest formula: (P * R * T) / 100
    return (getBalance * 5 * time) / 100;
  }
}
