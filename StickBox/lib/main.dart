import 'package:StickBox/Models/User.dart';
import 'package:StickBox/Services/Auth.dart';
import 'package:StickBox/Welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'MyColor.dart';
// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);
  Firebase.initializeApp();
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserSB>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'StickBox',
        theme: ThemeData(
          primarySwatch: createMaterialColor(Color(0xFF1F1F3A)),
          scaffoldBackgroundColor: Colors.white,
        ),
        home: Welcome(),
      ),
    );
  }
}
