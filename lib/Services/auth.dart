import 'package:firebase_auth/firebase_auth.dart';
import 'package:helping_hand_app/models/user.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Users? _userFromCredUser(User? user) {
    return user != null ? Users(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<Users?> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _userFromCredUser(user));
  }

  //sign in
  Future signInEmail(String email, String password) async {
    try {
      final UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      final User? user = result.user;
      return _userFromCredUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      final UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final User? user = result.user;
      return _userFromCredUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
