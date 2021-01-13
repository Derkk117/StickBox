import 'package:StickBox/Services/Auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AuthService service = AuthService();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            children: [
              Image.asset(
                'Assets/Images/Stick_logo.png',
                width: size.width / 4,
              ),
              SizedBox(
                width: (size.width / 4) * 2,
                height: size.width / 5,
                child: Padding(
                  padding: EdgeInsets.only(left: 5, right: 5),
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Text(getName()),
                        Text("Acount Type: Free"),
                        Text("Available Storage: --"),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                child: Center(
                  child: getImage(),
                ),
                /*child: getImage(),Image.network( getImage().toString()
                  service.getProfileImage(),
                  height: size.width / 5,
                ),*/
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Center(
          child: Text(
            "Your most voted stickers: ",
            style: TextStyle(color: Colors.white),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: SizedBox(
            width: size.width - 16,
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Image.asset('Assets/Images/Stick_logo.png',
                            width: size.width / 4),
                        Row(
                          children: [Icon(Icons.handyman), Text("25")],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Image.asset('Assets/Images/Stick_logo.png',
                            width: size.width / 4),
                        Row(
                          children: [Icon(Icons.handyman), Text("25")],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Image.asset('Assets/Images/Stick_logo.png',
                            width: size.width / 4),
                        Row(
                          children: [Icon(Icons.handyman), Text("25")],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Center(
          child: Text(
            "Your activity in forum: ",
            style: TextStyle(color: Colors.white),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          width: size.width - 16,
          child: Card(
            child: Row(
              children: [
                Icon(Icons.car_rental),
                Text("Some one likes your sticker."),
                Icon(Icons.more)
              ],
            ),
          ),
        ),
        SizedBox(
          width: size.width - 16,
          child: Card(
            child: Row(
              children: [
                Icon(Icons.car_rental),
                Text("Some one likes your sticker."),
                Icon(Icons.more)
              ],
            ),
          ),
        ),
        SizedBox(
          width: size.width - 16,
          child: Card(
            child: Row(
              children: [
                Icon(Icons.car_rental),
                Text("Some one likes your sticker."),
                Icon(Icons.more)
              ],
            ),
          ),
        ),
        SizedBox(
          width: size.width - 16,
          child: Card(
            child: Row(
              children: [
                Icon(Icons.car_rental),
                Text("Some one likes your sticker."),
                Icon(Icons.more)
              ],
            ),
          ),
        )
      ],
    );
  }

  Image getImage() {
    if (service.getProfileName() != null) {
      return Image.network(service.getProfileImage(), height: 70);
    } else {
      return Image.network(
          'https://definicion.de/wp-content/uploads/2019/06/perfildeusuario.jpg',height: 55);
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
