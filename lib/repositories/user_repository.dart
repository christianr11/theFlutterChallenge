import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class UserRepository {
  FirebaseAuth firebaseAuth;

  UserRepository() {
    this.firebaseAuth = FirebaseAuth.instance;
  }

  Future<User> registerUser(String email, String password) async {
    try {
      var response = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return response.user;
    } on PlatformException catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<User> signIn(String email, String password) async {
    try {
      var response = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return response.user;
    } on PlatformException catch (e) {
      throw Exception(e.toString());
    }
  }
}
