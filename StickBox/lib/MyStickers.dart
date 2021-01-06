import 'package:StickBox/MyColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyStickers extends StatefulWidget {
  @override
  _MyStickersState createState() => _MyStickersState();

  static const String root = '/';
  static const String detail = 'MyStickers.dart';
}

class _MyStickersState extends State<MyStickers> {
  _MyStickersState({this.navigatorKey, this.tabItem});

  final GlobalKey<NavigatorState> navigatorKey;
  final Tab tabItem;

  final int delayedAmount = 500;
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My Stickers",
      theme: ThemeData(
        primarySwatch: createMaterialColor(Color(0xFF1F1F3A)),
        scaffoldBackgroundColor: createMaterialColor(Color(0xFF121213)),
      ),
      home: Scaffold(
          /*appBar
            ),
          ),*/

          appBar: AppBar(
            title: const Text('My Stickers'),
            backgroundColor: Colors.blueAccent,
          ),
          bottomNavigationBar: BottomAppBar(
            //color: Color.alphaBlend(Colors.black, Colors.blue),
            child: new Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(icon: Icon(Icons.face), onPressed: null),
                IconButton(icon: Icon(Icons.forum), onPressed: null),
                IconButton(icon: Icon(Icons.home), onPressed: null),
                IconButton(icon: Icon(Icons.search), onPressed: null),
                IconButton(icon: Icon(Icons.account_circle), onPressed: null),
              ],
            ),
          ),
          body: Center(
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.search),
                  title: Text('Search'),
                  onTap: () => {},
                  tileColor: Colors.blueAccent,
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: FlatButton(
                          color: Colors.indigo,
                          textColor: Colors.white,
                          padding: EdgeInsets.all(8.0),
                          splashColor: Colors.blueAccent,
                          /*shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(20.0)),*/
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: Colors.black,
                                width: 5,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          height: 80,
                          onPressed: () {},
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(
                              "See all",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w300),
                            ),
                          )),
                    ),
                    Expanded(
                      child: FlatButton(
                          color: Colors.indigo,
                          textColor: Colors.white,
                          padding: EdgeInsets.all(8.0),
                          splashColor: Colors.blueAccent,
                          /*shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(20.0)),*/
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: Colors.black,
                                width: 5,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          height: 80,
                          onPressed: () {},
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(
                              "Tendencies",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w300),
                            ),
                          )),
                    ),
                  ],
                ),

                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 30.0,
                ),

                ///////////Carpeta

                ListTile(
                  leading: Icon(Icons.face),
                  title: Text('Carpeta N'),
                  onTap: () => {},
                  tileColor: Colors.blueAccent,
                ),

                Container(
                  child: FlatButton(
                    //color: Colors.indigo,
                    textColor: Colors.blueAccent,
                    padding: EdgeInsets.all(8.0),
                    splashColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Colors.black,
                          width: 5,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    /*shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(20.0)),*/
                    height: 80,
                    onPressed: () {},
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 200, 0),
                      child: Text(
                        "Carpeta N",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 20,
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
