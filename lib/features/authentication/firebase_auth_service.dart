// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //create a new user using their email and password
  Future<User?> signUpWithEmailAndPassword(String email, String password) async
  {
    try {UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    return credential.user;
    } catch (e){
      print('Some error occured');
    }
    return null;
  }
  //sign in a user with their email and password
  Future<User?> signInWithEmailAndPassword(String email, String password) async
  {
    try {UserCredential credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
    return credential.user;
    } catch (e){
      print('Some error occured');
    }
    return null;
  }
}