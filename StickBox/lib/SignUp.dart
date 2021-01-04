import 'package:StickBox/MyColor.dart';
import 'package:flutter/material.dart';
import 'delayed_animation.dart';
import 'package:flutter/services.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with SingleTickerProviderStateMixin {
  final int delayedAmount = 500;
  double titleSize = 30;
  AnimationController _controller;
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 200,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
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
        scaffoldBackgroundColor: createMaterialColor(Color(0xFF212150)),
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text("Sign Up"),
          ),
          body: Center(
            child: ListView(
              children: [
                SizedBox(
                  height: 20,
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
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                    children: [
                      DelayedAnimation(
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(8.0),
                            labelText: 'Your name',
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                        delay: delayedAmount + 500,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      DelayedAnimation(
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(8.0),
                            border: OutlineInputBorder(),
                            filled: true,
                            labelText: 'E-mail/Phone number',
                            fillColor: Colors.white,
                          ),
                        ),
                        delay: delayedAmount + 1000,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      DelayedAnimation(
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(8.0),
                            border: OutlineInputBorder(),
                            filled: true,
                            labelText: 'Password',
                            fillColor: Colors.white,
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
              ],
            ),
          )),
    );
  }
}
