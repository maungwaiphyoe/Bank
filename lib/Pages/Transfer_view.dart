import 'package:databasemasterdemo/Models/bank.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransferView extends StatefulWidget {
  Function updateParent;
  TransferView({this.updateParent});
  @override
  _TransferViewState createState() {
    // TODO: implement createState
    return _TransferViewState();
  }
}

class _TransferViewState extends State<TransferView> {
  double _amount;
  int _accountID;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Transfer"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width / 1.5,
              child: TextField(
                decoration:
                    InputDecoration(hintText: "Enter Amount to Transfer"),
                onChanged: (value) {
                  _amount = double.parse(value);
                },
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.5,
              child: TextField(
                decoration:
                    InputDecoration(hintText: "Enter Acc No. to Transfer"),
                onChanged: (value) {
                  _accountID = int.parse(value);
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              child: Text(
                "     Transfer     ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  // fontStyle: FontStyle.italic,
                  fontSize: 18,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              color: Colors.indigoAccent,
              onPressed: () {
                transfer();
              },
            )
          ],
        ),
      ),
    );
  }

  transfer() async {
    if (_accountID != null && _accountID > 0) {
      var bank = Bank();
      var isExist = await bank.isAccountExit(_accountID);

      if (isExist) {
        if (_amount > 0) {
          var resultFuture = Bank.currentAccount.transfer(_amount, _accountID);
          resultFuture.then((v) {
            print("save");
            if (widget.updateParent != null) widget.updateParent();
          });
        } else {
          print("account $_accountID not exist");
        }
      }
    }
  }
}
