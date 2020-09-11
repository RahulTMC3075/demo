///Importing http package to make network request
///Importing material package for material design
///Importing convert package for JSON file conversion
///Importing async to work with asynchronous computations
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ///Variable to store responce
  String user;
  String pass;

  ///Amazon gateway API URL
  final String url =
      'https://n96h0krub8.execute-api.us-east-1.amazonaws.com/live/item';

  ///Asynchronous function to make GET call and retrieve the data from server (userId and password)
  Future<String> makeRequest() async {
    var responce = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    ///Called when states changes and updated user and pass
    setState(() {
      var converData = json.decode(responce.body);
      user = converData['userId'];
      pass = converData['password'];
    });
    return "success";
  }

  /// Override this method to perform initialization
  @override
  void initState() {
    super.initState();
    this.makeRequest();
  }

  ///Asynchronous function to show pop ups and user end data is passed as a parameter
  Future<void> _showMyDialog(String i, String k) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('LOG IN'),
          content: Text((() {
            ///Comparing user data and retrieved data
            if (user == i && pass == k) {
              return "successful";
            } else {
              return "incorrect user or password";
            }
          })()),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  ///Log in page
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Spacer(),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      child: Center(
                        child: Text(
                          "SIGN IN",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Icon(
                              Icons.person,
                              color: Colors.green,
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              controller: nameController,
                              decoration: InputDecoration(
                                hintText: "Username",
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Icon(
                              Icons.lock,
                              color: Colors.green,
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              obscureText: true,
                              controller: passwordController,
                              decoration: InputDecoration(
                                hintText: "Password",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      child: RaisedButton(
                          color: Colors.green,
                          child: Text("log in"),
                          onPressed: () {
                            ///Passing user data in _showDialog function
                            _showMyDialog(
                                nameController.text, passwordController.text);
                          }),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
