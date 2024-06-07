
import 'package:flutter/material.dart';
import 'package:flutter_application_3/features/quizes/cat_quiz.dart';

class CatDir extends StatelessWidget {
  const CatDir({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: ((context) => const CatQuiz())
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
        color: Colors.orange,
        ),
        child: const Center(
          child: Text('CAT', style: TextStyle(fontSize: 15,
           fontWeight: FontWeight.bold
           ),
           ),
          ),
          ),
    );
  }
}