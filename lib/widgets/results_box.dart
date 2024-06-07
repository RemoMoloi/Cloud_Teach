import 'package:flutter/material.dart';
import '../constants.dart';

class ResultBox extends StatelessWidget {
  const ResultBox({super.key, 
  required this.result, 
  required this.questionLength, 
  required this.onPressed});

  final int result;
  final int questionLength;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: background,
      content: Padding(padding: const EdgeInsets.all(70),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Result', style: TextStyle(color: Colors.white, fontSize: 22),
          ),
          const SizedBox(height: 20,),
          CircleAvatar(
          backgroundColor: result == questionLength/2
          ?Colors.yellow
          : result<questionLength/2
          ? incorrect
          : correct,
          radius: 60,
          child: Text('$result/$questionLength', 
          style: const TextStyle(fontSize: 30),),
          ),
          const SizedBox(height: 20,),
          Text( result == questionLength/2
          ?'Almost There'
          : result<questionLength/2
          ? 'Try Again ?'
          : 'Well Done!',
          style: const TextStyle(
            color: Colors.white),
            ),
            const SizedBox(height: 25,),
            GestureDetector(
              onTap:onPressed,
              child: const Text('Start Over ?',
              style: TextStyle(
                color: Colors.green,
                fontSize: 20,
                //letterSpacing: 1.0,
                fontWeight: FontWeight.bold
              ),
              ),
            ),
            const SizedBox(height: 30,),
            GestureDetector(
              onTap:(){
                Navigator.pop(context);
              },
              child: const Text('Done',
              style: TextStyle(
                color: Colors.cyanAccent,
                fontSize: 20,
                letterSpacing: 1.0,
                fontWeight: FontWeight.bold
              ),
              ),
            ),
        ],
      ),
      ),

    );
  }
}