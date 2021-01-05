import 'package:StickBox/Models/User.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Create user object based on Firebase user
  UserSB _userFromFirebase(User user) {
    return user != null ? UserSB(uid: user.uid) : null;
  }

  //Auth change user stream
  Stream<UserSB> get user {
    return _auth
        .authStateChanges()
        //.map((User user) => _userFromFirebase(user));
        .map(_userFromFirebase);
  }

  //Sing in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;

      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  //Sing with email and password

  //Register with email and password

  //Sign out
}
