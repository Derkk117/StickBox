import 'package:StickBox/MyColor.dart';
import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'delayed_animation.dart';
import 'package:flutter/services.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with SingleTickerProviderStateMixin {
  final int delayedAmount = 500;
  double _scale;
  AnimationController _controller;
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 200,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final color = Colors.white;
    _scale = 1 - _controller.value;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('Assets/Images/agujero-negro.jpg'),
                  fit: BoxFit.cover)),
          child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: Column(
                  children: <Widget>[
                    AvatarGlow(
                      endRadius: 100,
                      duration: Duration(seconds: 2),
                      glowColor: Colors.white24,
                      repeat: true,
                      repeatPauseDuration: Duration(seconds: 2),
                      startDelay: Duration(seconds: 1),
                      child: Material(
                          elevation: 8.0,
                          shape: CircleBorder(),
                          child: CircleAvatar(
                            backgroundColor: Colors.grey[100],
                            child: ClipRRect(
                              child: Image.asset(
                                'Assets/Images/Stick_logo.png',
                              ),
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                            /*child: Image.asset("assets/Images/background.png"),*/
                            radius: 70.0,
                          )),
                    ),
                    DelayedAnimation(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Nombre',
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                      delay: delayedAmount + 1000,
                    ),
                    DelayedAnimation(
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          filled: true,
                          labelText: 'Correo/Telefono',
                          fillColor: Colors.white,
                        ),
                      ),
                      delay: delayedAmount + 2000,
                    ),
                    DelayedAnimation(
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          filled: true,
                          labelText: 'Contrasena',
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    DelayedAnimation(
                      child: Text(
                        "All your stickers in a safe place",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: color,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      delay: delayedAmount + 3000,
                    ),
                    DelayedAnimation(
                      child: Text(
                        "no matters if you change your device.",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: color,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      delay: delayedAmount + 3000,
                    ),
                    SizedBox(
                      height: 100.0,
                    ),
                    DelayedAnimation(
                      child: GestureDetector(
                        onTapDown: _goToLogIn,
                        onTapUp: _clear,
                        child: Transform.scale(
                          scale: _scale,
                          child: _animatedButtonUI,
                        ),
                      ),
                      delay: delayedAmount + 4000,
                    ),
                    DelayedAnimation(
                      child: GestureDetector(
                        onTapDown: _goToSignUp,
                        onTapUp: _clear,
                        child: Transform.scale(
                          scale: _scale,
                          child: _animatedLabelButtonUI,
                        ),
                      ),
                      delay: delayedAmount + 5000,
                    ),
                  ],
                ),
              )),
        ));
  }

  Widget get _animatedLabelButtonUI => Container(
        height: 60,
        width: 270,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Colors.transparent,
        ),
      );

  Widget get _animatedButtonUI => Container(
        height: 60,
        width: 270,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Colors.white,
        ),
        child: Center(
          child: Text(
            'Sign Up ',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: createMaterialColor(Color(0xFF4079E0)),
            ),
          ),
        ),
      );

  void _goToLogIn(TapDownDetails details) {
    _controller.forward();
    /*Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LogIn()),
    );*/
  }

  void _goToSignUp(TapDownDetails details) {
    _controller.forward();
    /*Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUp()),
    );*/
  }

  void _clear(TapUpDetails details) {
    _controller.reverse();
  }
}
