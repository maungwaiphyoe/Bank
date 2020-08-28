import 'package:databasemasterdemo/Models/bank.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SavingView extends StatefulWidget {
  Function updateParent; //tohandshake update to home
  SavingView({this.updateParent});
  @override
  _SavingViewState createState() {
    // TODO: implement createState
    return _SavingViewState();
  }
}

class _SavingViewState extends State<SavingView> {
  double _amount;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Saving"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width / 1.5,
              child: TextField(
                  decoration: InputDecoration(hintText: "Enter Amount to Save"),
                  onChanged: (value) {
                    _amount = double.parse(value) ?? 0;
                  }),
            ),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              child: Text(
                "     Save     ",
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
      var resultFuture = Bank.currentAccount.save(_amount);
      resultFuture.then((v) {
        print("save");
        if (widget.updateParent != null) widget.updateParent();
      });
    }
  }
}
