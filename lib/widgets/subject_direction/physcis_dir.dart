import 'package:flutter/material.dart';
import 'package:flutter_application_3/features/quizes/physics_quiz.dart';

class PhhysicsDir extends StatelessWidget {
  const PhhysicsDir({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: ((context) => const PhysicsQuiz())
            ));
      },
      child: Container(
            height: 140,
            width: 170,
            decoration: const BoxDecoration(
      borderRadius:
         BorderRadius.all(
        Radius.circular(20),
        ),
        color: Colors.purple,
        ),
        child: const Center(
          child: Text('Physical Science', style: TextStyle(fontSize: 15,
           fontWeight: FontWeight.bold
           ),
           ),
          ),
          ),
    );
  }
}