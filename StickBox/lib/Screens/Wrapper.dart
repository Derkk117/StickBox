import 'package:StickBox/Models/User.dart';
import 'package:StickBox/Screens/Authenticate/Authenticate.dart';
import 'package:StickBox/Screens/Home/Home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserSB>(context);

    //return either Home or Authenticate widget.
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
