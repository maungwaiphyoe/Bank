import 'package:databasemasterdemo/Models/bank.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WithdrawView extends StatefulWidget {
  Function updateParent;
  WithdrawView({this.updateParent});
  @override
  _WithdrawViewState createState() {
    // TODO: implement createState
    return _WithdrawViewState();
  }
}

class _WithdrawViewState extends State<WithdrawView> {
  double _amount;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Withdraw",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            // fontStyle: FontStyle.italic,
            fontSize: 18,
          ),
        ),
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
                    InputDecoration(hintText: "Enter Amount to Withdraw"),
                onChanged: (value) {
                  _amount = double.parse(value);
                },
              ),
            ),
            // Container(
            //   width: MediaQuery.of(context).size.width / 1.5,
            //   child: TextField(),
            // ),
            SizedBox(
              height: 10,
            ),

            RaisedButton(
              child: Text("Withdraw"),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              color: Colors.indigoAccent,
              onPressed: () {
                save();
              },
            )
          ],
        ),
      ),
    );
  }

  save() {
    if (_amount > 0) {
      var resultFuture = Bank.currentAccount.withdraw(_amount);
      resultFuture.then((v) {
        print("save");
        if (widget.updateParent != null) widget.updateParent();
      });
    }
  }
}
