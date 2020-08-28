import 'package:databasemasterdemo/Models/bank.dart';
import 'package:databasemasterdemo/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() {
    // TODO: implement createState
    return _LoginViewState();
  }
}

class _LoginViewState extends State<LoginView> {
  String _username;
  String _password;
  Bank _bank;
  @override
  void initState() {
    super.initState();
    _bank = Bank();
  }

  login() async {
    var account = await _bank.login(_username, _password);
    print(account);
    if (account != null) {
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => HomeView()));
    } else {
      print("invalid username and password");
      // showDialog(context: null)
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.blue[50],
      // appBar: AppBar(
      //   title: Text("Login"),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text(
                "AUNG bank",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    // fontStyle: FontStyle.italic,
                    fontSize: 50),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                width: MediaQuery.of(context).size.width / 1.5,
                child: TextField(
                  decoration: InputDecoration(hintText: "User"),
                  onChanged: (value) {
                    _username = value;
                  },
                )),
            Container(
              width: MediaQuery.of(context).size.width / 1.5,
              child: TextField(
                decoration: InputDecoration(hintText: "Password"),
                onChanged: (value) {
                  _password = value;
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            RaisedButton(
              child: Text("     login     ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    // fontStyle: FontStyle.italic,
                    fontSize: 18,
                  )),
              onPressed: () {
                //login enter ***
                login();
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              color: Colors.indigoAccent,
            ),
            // SizedBox(
            //   height: 80,
            // ),
          ],
        ),
      ),
    );
  }
}
