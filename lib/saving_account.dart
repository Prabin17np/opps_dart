import 'package:opps_dart/bank_account.dart';

class SavingAccount extends BankAccount {
  final double minBalance = 500;
  int _withdrawThisMonth = 0;
  final int _withdrawlLimit = 3;

  SavingAccount({
    required super.accNumber,
    required super.accHolderName,
    required super.balance,
  });

  @override
  void deposit(double amount) {
    setBalance = getBalance + amount;
    print("Deposited Successfully !");
  }

  @override
  void withdraw(double amount) {
    if (_withdrawThisMonth > _withdrawlLimit) {
      print(
        "The limit of withdrawl for this month ($_withdrawlLimit) has been reached !!!",
      );
    } else {
      if ((getBalance - amount) < minBalance) {
        print("Minimum balance requirement of \$500 !!!");
      } else {
        setBalance = getBalance - amount;
        print("Amount $amount has been withdrawn !");
        _withdrawThisMonth++;
      }
    }
  }

  double interestCalculation(double time) {
    return (getBalance * time * 2) / 100;
  }

  void resetWithdrawlThisMonth() {
    _withdrawThisMonth = 0;
  }
}
