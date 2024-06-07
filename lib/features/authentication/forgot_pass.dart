import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/constants.dart';
import 'package:flutter_application_3/widgets/text_field.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}




class _ForgotPasswordState extends State<ForgotPassword> {

  final resetPass = TextEditingController();

  final snackBar = const SnackBar(content: Text('Email sent! Check your mail'));

  @override
  void dispose() {
    resetPass.dispose();
    super.dispose();
  }

  //sending email to reset password
  Future passwordRest() async {
    try {
      await FirebaseAuth.instance.
      sendPasswordResetEmail(email: resetPass.text.trim());
    } on FirebaseAuthException catch (e) {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context, 
        builder: (context){
          return AlertDialog(
            content: Text(e.message.toString()),
          );
        });
    }
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Password Reset'),
      backgroundColor: background,
      elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Enter Your Email address for a password reset link', style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold
          ),),
          const SizedBox(height: 15,),
          //email textfield
          MyTextField(
            controller: resetPass,
             hintText: 'Email Address',
             obscureText: false),
             const SizedBox(height: 15,),
             //button
             GestureDetector(
              onTap: passwordRest,
               child: Container(
                height: 60,
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.black
                ),
                child: const Center(
                  child:  Text(
                    'Send', 
                  style: TextStyle(fontSize: 25, 
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                  ),
                  ),
                ),
               ),
             ),
            
        ],
      ),
    );
  }
}