///Importing package
import 'package:flutter/material.dart';

///Log in App according to Figma
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
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override

  /// log in page
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Column(
          children: <Widget>[
            Spacer(),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: <Widget>[
                    /// Heading for log in app
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        child: Center(
                          child: Text(
                            "LOG IN",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),

                    /// username box
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        width: 250.0,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
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

                    ///password box
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        width: 250.0,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
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

                    /// log in button
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        child: RaisedButton(
                            color: Colors.green,
                            child: Text("log in"),
                            onPressed: () {}),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
