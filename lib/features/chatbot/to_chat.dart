import 'package:flutter/material.dart';
import 'package:flutter_application_3/constants.dart';

import 'chatbot.dart';

class Charlie extends StatelessWidget {
  const Charlie({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
        title: const Text('Cloud Teach'),
      ),
      body: Center(
        //button to go to the chatbot
        child: GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(
              builder: (context)=> const ChatPage(),
              ),
            );
          },
          child: Container(
            height: 100,
            width: 250,
            decoration:  BoxDecoration(
              color: background,
              borderRadius: BorderRadius.circular(15)
            ),
            child: const Center(child: Text(
              'Go to Charlie', 
              style: TextStyle(
                fontSize: 25, 
                fontWeight: FontWeight.bold,
                color: Colors.white),
                ),
                ),
            ),
        ),
      ),
      );
  }
}