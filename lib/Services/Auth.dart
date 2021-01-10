import 'package:StickBox/Models/User.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

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
  Future loginWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;

      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;

      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Sign in with google
  Future googleSignIn() async {
    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    UserCredential result = (await _auth.signInWithCredential(credential));
    User user = result.user;

    return _userFromFirebase(user);
  }

  getProfileName(){
    if(_auth.currentUser.displayName != null){
      return _auth.currentUser.displayName;
    }
  }

  //Function to get the image user logged with google.
  getProfileImage() {
    try{
      return _auth.currentUser.photoURL;
    } catch (e) {
      return null;
    }
    if (_auth.currentUser.photoURL != null) {
      return _auth.currentUser.photoURL;
    }
  }

  getEmail(){
    return _auth.currentUser.email;
  }
  //Sign out
  Future signOut() async {
    try {
      return await _auth.signOut().then((onValue) {
        _googleSignIn.signOut();
      });
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
