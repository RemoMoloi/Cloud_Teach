import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/features/authentication/login_or_register.dart';
import '../pages/navigation_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(), 
        builder: (context, snapshot){
          //check if user is logged in
          if(snapshot.hasData)
          {
            return const HomePage();
          }else{
            return const LoginOrRegister();
          }
          //check if user is not logged in
        }),
    );
  }
}