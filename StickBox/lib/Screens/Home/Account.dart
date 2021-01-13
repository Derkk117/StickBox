import 'dart:ui';

import 'package:StickBox/Services/Auth.dart';
import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  AuthService service = AuthService();
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 80,
        ),
        Container(
          child: Center(
            //child: Image.network(service.getProfileImage(),),
            child: getImage(),
          ),
        ),
        Container(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(25),
              child: Row(
                children: [
                  SizedBox(
                    width: 300 /*(size.width / 4) * 2*/,
                    //height: 100/*size.width / 5*/,
                    child: Padding(
                      padding: EdgeInsets.only(left: 0, right: 0),
                      child: Container(
                        //color: Colors.white,
                        child: Column(
                          children: [
                            RichText(
                                text: TextSpan(
                              text: 'Name:',
                              style: TextStyle(
                                  color: Colors.lightBlue, fontSize: 20),
                            )),
                            TextFormField(
                              validator: (val) => val.isEmpty ? '' : null,
                              onChanged: (val) {
                                //setState(() =>  val = 'hola');
                              },
                              style: TextStyle(color: Colors.lightBlue),
                              decoration: InputDecoration(
                                  hintText: getName(),
                                  hintStyle: TextStyle(
                                      color: Colors.blueAccent, fontSize: 20),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                    style: BorderStyle.solid,
                                    color: Colors.blue,
                                  ))),
                            ),
                            RichText(
                                text: TextSpan(
                              text: 'Account Type:',
                              style: TextStyle(
                                  color: Colors.lightBlue, fontSize: 20),
                            )),
                            TextFormField(
                              validator: (val) => val.isEmpty ? '' : null,
                              onChanged: (val) {
                                //setState(() =>  val = 'hola');
                              },
                              style: TextStyle(color: Colors.lightBlue),
                              decoration: InputDecoration(
                                  hintText: getType(),
                                  hintStyle: TextStyle(
                                      color: Colors.blueAccent, fontSize: 20),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                    style: BorderStyle.solid,
                                    color: Colors.blue,
                                  ))),
                            ),
                            RichText(
                                text: TextSpan(
                              text: 'Available Storage:',
                              style: TextStyle(
                                  color: Colors.lightBlue, fontSize: 20),
                            )),
                            TextFormField(
                              validator: (val) => val.isEmpty ? '' : null,
                              onChanged: (val) {
                                //setState(() =>  val = 'hola');
                              },
                              style: TextStyle(color: Colors.lightBlue),
                              decoration: InputDecoration(
                                  hintText: 'a', //service.getProfileName(),
                                  hintStyle: TextStyle(
                                      color: Colors.blueAccent, fontSize: 20),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                    style: BorderStyle.solid,
                                    color: Colors.blue,
                                  ))),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        /*Center(
          child: FlatButton(
            color: Colors.blue,
            onPressed: () {},
            child: Text('Save'),
          ),
          /*child: Text(
            "Your most voted stickers: ",
            style: TextStyle(color: Colors.white),
          ),*/
        ),*/
        SizedBox(
          height: 10,
        ),
        Center(),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  getType() {
    if (service.getProfileName() != null) {
      return 'Account Google';
    } else {
      return 'Account email';
    }
  }

  Image getImage() {
    if (service.getProfileName() != null) {
      return Image.network(service.getProfileImage());
    } else {
      return Image.network(
          'https://definicion.de/wp-content/uploads/2019/06/perfildeusuario.jpg');
    }
  }

  getName() {
    if (service.getProfileName() != null) {
      return service.getProfileName();
    } else {
      return service.getEmail();
    }
  }
}
