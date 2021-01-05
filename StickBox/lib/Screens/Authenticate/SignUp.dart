import 'package:StickBox/MyColor.dart';
import 'package:StickBox/Services/Auth.dart';
import 'package:flutter/material.dart';
import 'package:StickBox/delayed_animation.dart';
import 'package:flutter/services.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with SingleTickerProviderStateMixin {
  final int delayedAmount = 500;
  final AuthService _auth = AuthService();

  double titleSize = 35;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Sign Up",
      theme: ThemeData(
        primarySwatch: createMaterialColor(Color(0xFF1F1F3A)),
        scaffoldBackgroundColor: createMaterialColor(Color(0xFF121213)),
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text("Sign Up"),
          ),
          body: Center(
            child: ListView(
              children: [
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: Container(
                    width: size.width / 2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(width: 1, color: Colors.white)),
                    height: 80,
                    child: Center(
                      child: new RichText(
                        text: new TextSpan(
                          children: [
                            new TextSpan(
                              text: 'S',
                              style: new TextStyle(
                                  color: Colors.yellow, fontSize: titleSize),
                            ),
                            new TextSpan(
                              text: 't',
                              style: new TextStyle(
                                  color: Colors.blue, fontSize: titleSize),
                            ),
                            new TextSpan(
                              text: 'i',
                              style: new TextStyle(
                                  color: Colors.red, fontSize: titleSize),
                            ),
                            new TextSpan(
                              text: 'c',
                              style: new TextStyle(
                                  color: Colors.pink, fontSize: titleSize),
                            ),
                            new TextSpan(
                              text: 'k',
                              style: new TextStyle(
                                  color: Colors.green, fontSize: titleSize),
                            ),
                            new TextSpan(
                              text: 'B',
                              style: new TextStyle(
                                  color: Colors.purple, fontSize: titleSize),
                            ),
                            new TextSpan(
                              text: 'o',
                              style: new TextStyle(
                                  color: Colors.orange, fontSize: titleSize),
                            ),
                            new TextSpan(
                              text: 'x',
                              style: new TextStyle(
                                  color: Colors.teal, fontSize: titleSize),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      DelayedAnimation(
                        child: new Theme(
                          data: new ThemeData(
                              brightness: Brightness.dark,
                              inputDecorationTheme: InputDecorationTheme(
                                labelStyle: TextStyle(color: Colors.blue),
                              )),
                          child: new TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: new InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    style: BorderStyle.solid,
                                    color: Colors.blue,
                                  ),
                                ),
                                labelText: 'Your Name:',
                                labelStyle: TextStyle(color: Colors.blue)),
                          ),
                        ),
                        delay: delayedAmount + 500,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      DelayedAnimation(
                        child: new Theme(
                          data: new ThemeData(
                              brightness: Brightness.dark,
                              inputDecorationTheme: InputDecorationTheme(
                                labelStyle: TextStyle(color: Colors.blue),
                              )),
                          child: new TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: new InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    style: BorderStyle.solid,
                                    color: Colors.blue,
                                  ),
                                ),
                                labelText: 'E-mail / Phone number:',
                                labelStyle: TextStyle(color: Colors.blue)),
                          ),
                        ),
                        delay: delayedAmount + 1000,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      DelayedAnimation(
                        child: new Theme(
                          data: new ThemeData(
                              brightness: Brightness.dark,
                              inputDecorationTheme: InputDecorationTheme(
                                labelStyle: TextStyle(color: Colors.blue),
                              )),
                          child: new TextField(
                            style: TextStyle(color: Colors.white),
                            obscureText: true,
                            decoration: new InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    style: BorderStyle.solid,
                                    color: Colors.blue,
                                  ),
                                ),
                                labelText: 'Password:',
                                labelStyle: TextStyle(color: Colors.blue)),
                          ),
                        ),
                        delay: delayedAmount + 1500,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: size.width / 4, right: size.width / 4),
                  child: FlatButton(
                      color: Colors.indigo,
                      textColor: Colors.white,
                      padding: EdgeInsets.all(8.0),
                      splashColor: Colors.blueAccent,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(50.0)),
                      onPressed: () {
                        /*Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LogIn()),
                      );*/
                      },
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          "Continue",
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w300),
                        ),
                      )),
                ),
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: Text(
                    "Or continue with:",
                    style: TextStyle(fontSize: 18, color: Colors.indigo),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 5.0),
                  child: new RaisedButton(
                      padding:
                          EdgeInsets.only(top: 3.0, bottom: 3.0, left: 3.0),
                      color: createMaterialColor(Color(0xFF121213)),
                      onPressed: () {},
                      child: new Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          new Image.asset(
                            'Assets/Images/google.png',
                            height: 48.0,
                          ),
                          new Container(
                              padding: EdgeInsets.only(left: 10.0, right: 10.0),
                              child: new Text(
                                "Sign in with Google",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                        ],
                      )),
                ),
              ],
            ),
          )),
    );
  }
}
