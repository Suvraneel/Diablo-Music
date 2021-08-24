import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signIn(String email, String pass) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: pass);
      FirebaseUser user = result.user;
      return user;
    }
    catch(e) {
      print(e.toString());
      return null;
    }
  }

  Future signUp(String name, String email, String pass) async {
    final dbref = FirebaseDatabase.instance.reference();
    AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: pass);
    FirebaseUser user = result.user;
    dbref.child("user").child(user.uid).set({
      'name': name,
    });
    return user;
  }
}