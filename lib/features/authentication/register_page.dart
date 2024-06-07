import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/widgets/my_button.dart';
import 'package:flutter_application_3/widgets/text_field.dart';

class RegisterPage extends StatefulWidget {
  
  final Function()? onTap;
  const RegisterPage({
  super.key, 
  required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  
  // sign user up
  void signUserUp() async {
    //show loading circle
    showDialog(
    context: context, 
    builder: (context){
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    );

    // try creating the user
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
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
                const Text('Create an account', 
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
                ),
                //const SizedBox(height: 70,),
                Image.asset('assets/images/logo2.jpg',
                height: 200,
                width: 250,),
                const SizedBox(height: 10,),
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
                 MyButton(
                  onTap: signUserUp, button: 'Sign Up',
                 ),
                 const SizedBox(height: 50,),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account ? ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                    ),
                    const SizedBox(width: 10,),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text('Login now.',
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
