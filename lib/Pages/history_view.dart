import 'package:databasemasterdemo/Models/bank.dart';
import 'package:databasemasterdemo/Models/transaction.dart';
import 'package:databasemasterdemo/Pages/transactionItemView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HistoryView extends StatefulWidget {
  @override
  _HistoryViewState createState() {
    // TODO: implement createState
    return _HistoryViewState();
  }
}

class _HistoryViewState extends State<HistoryView> {
  List<Transaction> _trans = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var transFuture = Bank.currentAccount.getTransactions();
    transFuture.then((transacs) {
      this._trans = transacs;
      setState(() {
        
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("History"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _trans.length,
        itemBuilder: (context, index) {
          return TransactionItemView(_trans[index]);
        },
      ),
    );
  }
}
