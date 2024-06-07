import 'package:flutter/material.dart';
import 'package:flutter_application_3/constants.dart';
import 'package:flutter_application_3/features/task%20manager/task_page.dart';

class StartTask extends StatelessWidget {
  const StartTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
        title: const Text('Cloud Teach'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(
              builder: (context)=> const Home(),
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
              'View My Tasks', 
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