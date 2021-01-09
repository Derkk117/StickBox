import 'package:StickBox/Services/Auth.dart';
import 'package:flutter/material.dart';

import '../../MyColor.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
  int _currentIndex = 0;
  final tabs = [
    Center(
        child: Text(
      "My Stickers Page",
      style: TextStyle(color: Colors.white),
    )),
    Center(
        child: Text(
      "Forum Page",
      style: TextStyle(color: Colors.white),
    )),
    Center(
        child: Text(
      "Home Page",
      style: TextStyle(color: Colors.white),
    )),
    Center(
        child: Text(
      "Search Page",
      style: TextStyle(color: Colors.white),
    )),
    Center(
        child: Text(
      "Account Page",
      style: TextStyle(color: Colors.white),
    )),
  ];

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
            title: Text("Home"),
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
          body: tabs[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            items: [
              BottomNavigationBarItem(
                  icon: Image.asset(
                    'Assets/Images/Stick_logo.png',
                    height: 20,
                  ),
                  label: "My Stickers",
                  backgroundColor: createMaterialColor(Color(0xFF1F1F3A))),
              BottomNavigationBarItem(
                  icon: Icon(Icons.message),
                  label: "Forum",
                  backgroundColor: createMaterialColor(Color(0xFF1F1F3A))),
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Home",
                  backgroundColor: createMaterialColor(Color(0xFF1F1F3A))),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: "Search",
                  backgroundColor: createMaterialColor(Color(0xFF1F1F3A))),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: "Account",
                  backgroundColor: createMaterialColor(Color(0xFF1F1F3A))),
            ],
            onTap: (index) {
              setState(() => _currentIndex = index);
            },
          ),
        ));
  }
}
