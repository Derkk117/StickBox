import 'package:flutter/material.dart';
import 'package:flutter_whatsapp_stickers/flutter_whatsapp_stickers.dart';

class MyStickers extends StatefulWidget {
  @override
  _MyStickersState createState() => _MyStickersState();
}

class _MyStickersState extends State<MyStickers> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text("My Stickers Page"),
      ],
    );
  }
}
