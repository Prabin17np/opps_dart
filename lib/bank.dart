import './opps_dart.dart';

class Bank {
  final List _bankAccounts = [];

  BankAccount createAccount({
    required String accountType,
    required String accountHolder,
    required int accountNumber,
    required double balance,
  }) {
    BankAccount acc;
    if (accountType == "saving") {
      acc = SavingAccount(accountHolder, accountNumber, balance);
    } else if (accountType == "premium") {
      acc = PremiumAccount(accountHolder, accountNumber, balance);
    } else if (accountType == "checking") {
      acc = CheckingAccount(accountHolder, accountNumber, balance);
    } else {
      acc = StudentAccount(accountHolder, accountNumber, balance);
    }
    _bankAccounts.add({"account": acc, "type": accountType});
    return acc;
  }

  void findAccount({required int accNo}) {
    for (var bankAccount in _bankAccounts) {
      var bAccount = bankAccount['account'];
      if (bAccount.getAccountNumber == accNo) {
        print("Bank Account: ");
        print("Account holder: ${bAccount.getAccountHolder}");
        print("Account no: ${bAccount.getAccountNumber}");
        print("Account Balance: ${bAccount.getBalance}");
        return;
      }
    }
    print("Account not found");
  }

  void transferMoneyBtnAccount({
    required BankAccount provider,
    required BankAccount receiver,
    required double amount,
  }) {
    provider.withdraw(amount);
    receiver.deposit(amount);
  }

  void generateReport() {
    for (var bankAccount in _bankAccounts) {
      var bAccount = bankAccount['account'];
      print('Account Type: ${bankAccount['type']}');
      print("Account holder: ${bAccount.getAccountHolder}");
      print("Account no: ${bAccount.getAccountNumber}");
      print("Account Balance: ${bAccount.getBalance}");
      print("Transaction History:");
      bAccount.displayTransactionHistory();
      print("");
    }
  }
}
