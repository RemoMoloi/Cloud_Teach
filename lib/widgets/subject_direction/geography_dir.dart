import 'package:flutter/material.dart';
import 'package:flutter_application_3/features/quizes/geography_quiz.dart';

class GeoDir extends StatelessWidget {
  const GeoDir({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: ((context) => const GeographyQuiz())
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
        color: Colors.green,
        ),
        child: const Center(
          child: Text('Geography', style: TextStyle(fontSize: 15,
           fontWeight: FontWeight.bold
           ),
           ),
          ),
          ),
    );
  }
}