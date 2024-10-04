import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> register(String username, String email, String password, String contact, String address) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Store additional user data in Firestore or Realtime Database if needed.
    } on FirebaseAuthException catch (e) {
      throw Exception('Registration Failed: ${e.message}');
    }
  }

  Future<void> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw Exception('Login Failed: ${e.message}');
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}
