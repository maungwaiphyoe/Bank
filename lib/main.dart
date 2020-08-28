import 'package:databasemasterdemo/login_view.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Text(
                'Welcome to\nAUNG bank',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    // fontStyle: FontStyle.italic,
                    fontSize: 50),
              ),
              SizedBox(
                height: 50,
              ),
              RaisedButton(
                child: Text("     Start     ",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    // fontStyle: FontStyle.italic,
                    fontSize: 18,
                    ),),
                color: Colors.indigo,
                onPressed: () {
                  Navigator.pushReplacement(context,
                      new MaterialPageRoute(builder: (context) => LoginView()));
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                
              )
            ],
          ),
        ),
      ),
    );
  }
}
