import 'package:flutter/material.dart';
import 'package:flutter_application_3/features/quizes/business_quiz.dart';

class BusinessDir extends StatelessWidget {
  const BusinessDir({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: ((context) => const BusinessQuiz())
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
        color: Colors.yellow,
        ),
        child: const Center(
          child: Text('Business Studies', style: TextStyle(fontSize: 15,
           fontWeight: FontWeight.bold
           ),
           ),
          ),
          ),
    );
  }
}