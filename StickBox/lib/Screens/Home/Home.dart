import 'package:StickBox/Services/Auth.dart';
import 'package:flutter/material.dart';

import '../../MyColor.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Sign Up",
        theme: ThemeData(
          primarySwatch: createMaterialColor(Color(0xFF1F1F3A)),
          scaffoldBackgroundColor: createMaterialColor(Color(0xFF121213)),
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text("Home v1"),
              elevation: 0.0,
              actions: <Widget>[
                FlatButton.icon(
                  textColor: Colors.white,
                  icon: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  label: Text("Log out"),
                  onPressed: () async {
                    await _auth.signOut();
                  },
                )
              ],
            ),
            body: Center(
              child: ListView(
                children: [],
              ),
            )));
  }
}
