import 'package:databasemasterdemo/Models/bank.dart';
import 'package:databasemasterdemo/Pages/Transfer_view.dart';
import 'package:databasemasterdemo/Pages/history_view.dart';
import 'package:databasemasterdemo/Pages/saving_view.dart';
import 'package:databasemasterdemo/Pages/withdraw_view.dart';
import 'package:databasemasterdemo/login_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() {
    // TODO: implement createState
    return _HomeViewState();
  }
}

class _HomeViewState extends State<HomeView> {
  double _amount = 0.0;
  onUpdate() async {
    _amount = await Bank.currentAccount.amount;
    setState(() {
      // _amount +=
    });
  }

  Bank _bank;

  @override
  void initState() {
    super.initState();
    onUpdate();
    _bank = Bank();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: Text("Aung Bank"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.assignment_ind),
            onPressed: () async {
              await _bank.logout();
              Navigator.pushReplacement(context,
                  new MaterialPageRoute(builder: (context) => LoginView()));
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Total Amount: $_amount MMK",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  color: Colors.lightGreen,
                  child: Container(
                    height: 100,
                    width: 100,
                    child: Center(
                      child: Text(
                        "Saving",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => SavingView(
                                  updateParent: onUpdate,
                                )));
                  },
                ),
                SizedBox(
                  width: 5,
                ),
                RaisedButton(
                  color: Colors.redAccent,
                  child: Container(
                    height: 100,
                    width: 100,
                    child: Center(
                      child: Text(
                        "Withdraw",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => WithdrawView(
                                  updateParent: onUpdate,
                                )));
                  },
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  color: Colors.yellowAccent,
                  child: Container(
                    height: 100,
                    width: 100,
                    child: Center(
                      child: Text(
                        "Transfer",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => TransferView(
                                  updateParent: onUpdate,
                                )));
                  },
                ),
                SizedBox(
                  width: 5,
                ),
                RaisedButton(
                  color: Colors.blueAccent,
                  child: Container(
                    height: 100,
                    width: 100,
                    child: Center(
                      child: Text(
                        "History",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => HistoryView()));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
