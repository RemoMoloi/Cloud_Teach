import 'package:flutter/material.dart';
//import 'package:quiz_app_13_oct/constants.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({super.key,
   required this.question, 
   required this.indexAction, 
   required this.totalQuestion});


  final String question;
  final int indexAction;
  final int totalQuestion;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        'Question ${indexAction +1}/$totalQuestion: $question',
        style: const TextStyle(
          fontSize: 24.0,
          color: Colors.white
        ),
        
        ),
    );
  }
}