import 'package:opps_dart/opps_dart.dart';

import 'bank.dart';

void main() {
  Bank myBank = Bank();
  BankAccount mySavingAccount = myBank.createAccount(
    accountType: "saving",
    accountHolder: "saving accountHolder",
    accountNumber: 123,
    balance: 100000,
  );

  BankAccount myCheckingAccount = myBank.createAccount(
    accountType: "checking",
    accountHolder: "checking accountHolder",
    accountNumber: 13,
    balance: 100000,
  );

  BankAccount myStudentAccount = myBank.createAccount(
    accountType: "student",
    accountHolder: "student accountHolder",
    accountNumber: 2202,
    balance: 200,
  );

  SavingAccount savingAccount = SavingAccount("_accHolder", 12, 10000);
  PremiumAccount premiumAccount = PremiumAccount("_accHolder", 12, 10000);

  print(
    "Saving Account annual interest: ${savingAccount.calculateAnnualInterest()}",
  );
  print(
    "Premium Account monthly interest: ${premiumAccount.calculateMonthlyInterest()}",
  );

  print("");
  mySavingAccount.deposit(5000);

  mySavingAccount.withdraw(1000);

  myCheckingAccount.deposit(200);

  myBank.generateReport();

  mySavingAccount.withdraw(5000);
  myCheckingAccount.withdraw(9400);
  myBank.generateReport();

  myCheckingAccount.withdraw(90000000);
  print('');
  myBank.findAccount(accNo: 123);
}
