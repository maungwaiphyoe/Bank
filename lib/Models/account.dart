import 'package:databasemasterdemo/Models/transaction.dart';

class Account {
  int id;
  String username;
  String password;

  // double get amount=>0;
  Future<double> get amount async {
    var ttlAmt = 0.0;
    //calculate over all transaction and take the result
    List<Transaction> transactions = await Transaction.loadAllTransaction(
        this.id); //TODO transaction to load
    transactions.forEach((transaction) {
      var amount = transaction.amount;
      if (transaction.opr == "W" ||
          (transaction.opr == "T" && transaction.fromid == this.id))
        amount = -amount;
      ttlAmt += amount;
    });
    return ttlAmt;
  }

  // List<transac> transactions = [];
  List<Transaction> transactions = [];
  Account(this.id, this.username, this.password);

  //method

  Future<void> save(double amount) {
    var created = DateTime.now().toString();
    var transaction = Transaction(null, this.id, this.id, amount, "S", created);
    return transaction.save();
  }

  Future<void> withdraw(double amount) {
    var created = DateTime.now().toString();
    var transaction = Transaction(null, this.id, this.id, amount, "W", created);
    return transaction.save();
  }

  Future<void> transfer( double amount,int toid) {
    var created = DateTime.now().toString();
    var transaction = Transaction(null, this.id, toid, amount, "T", created);
    return transaction.save();
  }

  Future<List<Transaction>> getTransactions() {
    //slow because future
    //TODO load all transaction from dataBase
    return Transaction.loadAllTransaction(this.id);
  }

  Map<String, dynamic> toMap() {
    return {"id": id, "username": username, "password": password};
  }
}
