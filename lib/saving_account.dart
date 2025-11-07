import 'package:opps_dart/bank_account.dart';

class SavingAccount extends BankAccount {
  final double minBalance = 500;
  int _withdrawalsThisMonth = 0;
  final int _withdrawalLimit = 3;

  SavingAccount({
    required super.accNumber,
    required super.accHolderName,
    required super.balance,
  });

  @override
  void deposit(double amount) {
    setBalance = getBalance + amount;
    print("Deposited Successfully! New Balance: \$${getBalance}");
  }

  @override
  void withdraw(double amount) {
    if (_withdrawalsThisMonth >= _withdrawalLimit) {
      print(
        "The withdrawal limit for this month ($_withdrawalLimit) has been reached!",
      );
      return;
    }
    if ((getBalance - amount) < minBalance) {
      print("Minimum balance requirement of \$500 must be maintained!");
      return;
    }
    setBalance = getBalance - amount;
    _withdrawalsThisMonth++;
    print("Amount \$${amount} withdrawn! Remaining Balance: \$${getBalance}");
  }

  double interestCalculation(double time, [double rate = 2]) {
    return (getBalance * time * rate) / 100;
  }

  void resetWithdrawalsThisMonth() {
    _withdrawalsThisMonth = 0;
  }
}
