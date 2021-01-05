import 'package:StickBox/Welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'MyColor.dart';
// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StickBox',
      theme: ThemeData(
        primarySwatch: createMaterialColor(Color(0xFF1F1F3A)),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Welcome(),
    );
  }
}
