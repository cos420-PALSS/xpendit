import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

// separate authorization file for modularity of code - separates app from Firebase


abstract class BaseAuth {
  Future<String> signInWithEmailAndPassword(String email, String password);
  Future<String> createUserWithEmailAndPassword(String email, String password);
  Future<String> currentUser();
  Future<void> signOut();
}

class Auth implements BaseAuth{

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  
  //sign in method
  Future<String> signInWithEmailAndPassword(String email, String password) async {
    FirebaseUser user = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return user.uid;
  }

  //register account method
  Future<String> createUserWithEmailAndPassword(String email, String password) async {
    FirebaseUser user = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    return user.uid;
  }

  //get current user
  Future<String> currentUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user.uid;
  }

  //sign user out
  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}