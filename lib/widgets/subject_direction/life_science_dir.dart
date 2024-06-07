import 'package:flutter/material.dart';
import 'package:flutter_application_3/features/quizes/life_science_quiz.dart';

class LifeSDir extends StatelessWidget {
  const LifeSDir({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: ((context) => const LifeScienceQuiz())
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
        color: Colors.brown,
        ),
        child: const Center(
          child: Text('Life Science', style: TextStyle(fontSize: 15,
           fontWeight: FontWeight.bold
           ),
           ),
          ),
          ),
    );
  }
}