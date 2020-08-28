import 'package:databasemasterdemo/Models/bank.dart';
import 'package:databasemasterdemo/Models/transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget TransactionItemView(Transaction transac) {
  return Card(
    child: Column(
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(transac.amount.toString()),
            Text(transac.created)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
                "${transac.fromid == Bank.currentAccount.id ? 'Own' : transac.fromid.toString()}"),
            Text(transac.opr)
          ],
        )
      ],
    ),
  );
}
