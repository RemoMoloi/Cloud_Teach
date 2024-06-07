import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/widgets/my_button.dart';
import 'package:flutter_application_3/widgets/text_field.dart';

import 'forgot_pass.dart';

class LoginPage extends StatefulWidget {
  
  final Function()? onTap;
  const LoginPage({
  super.key, 
  required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  
  void signUserIn() async {

    showDialog(
    context: context, 
    builder: (context){
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text, 
      password: passwordController.text
      );
      //pop loading circle
       // ignore: use_build_context_synchronously
       Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      //pop loading circle
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      //catching error
      wrongCredentials(e.code);
    }
  }

//error handling
  void wrongCredentials(String message){
    showDialog(
      context: context, 
      builder: (context){
        return  AlertDialog( 
          title: Text(message),
        );
        
      }
      );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height:20,),
                const Text('Cloud Teach', 
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
                ),
                //const SizedBox(height: 70,),
                Image.asset('assets/images/logo2.jpg',
                height: 250,
                width: 250,),
                //const SizedBox(height: 5,),
                const Text('Sign In', 
                style: TextStyle(fontSize: 30, 
                fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15,),
                //email textfield
                 MyTextField(
            
                  hintText: 'Enter your email address',
                 obscureText: false,
                  controller: emailController,
                ),
                const SizedBox(height: 15,),
                //password textfield
                 MyTextField(
                 hintText: 'Enter your password',
                 obscureText: true, 
                 controller: passwordController,
                 ),
                 const SizedBox(height: 15,),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                   children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:25.0),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context)=> const ForgotPassword()
                              ));
                          },
                          child: const Text(
                          'Forgot Password ?',
                           style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold
                                             ),),
                        ),
                      ),
                   ],
                 ),
                 const SizedBox(height: 15,),
                 MyButton(
                  onTap: signUserIn, 
                  button: 'Sign In',
                 ),
                 const SizedBox(height: 50,),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Not registered yet ? ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                    ),
                    const SizedBox(width: 10,),
                    //button
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text('Register now.',
                       style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold
                       ),
                       ),
                    ),
                  ],
                 )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
