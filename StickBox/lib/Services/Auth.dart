import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Sing in anon

  //Sing with email and password

  //Register with email and password

  //Sign out
}
