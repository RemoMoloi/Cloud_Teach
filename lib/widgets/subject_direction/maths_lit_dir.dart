import 'package:flutter/material.dart';
import 'package:flutter_application_3/features/quizes/math_lit_quiz.dart';

class MathsLitDir extends StatelessWidget {
  const MathsLitDir({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: ((context) => const MathsLitQuiz())
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
        color: Colors.blue,
        ),
        child: const Center(
          child: Text('Maths Lit', style: TextStyle(fontSize: 15,
           fontWeight: FontWeight.bold
           ),
           ),
          ),
          ),
    );
  }
}