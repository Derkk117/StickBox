import 'package:StickBox/Screens/Home/Home.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return either Home or Authenticate widget.
    return Home();
  }
}