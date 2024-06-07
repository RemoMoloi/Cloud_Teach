import 'package:flutter/material.dart';
//import 'package:quiz_app_13_oct/constants.dart';
//import '../constants.dart';

class OptionCard extends StatelessWidget {
  const OptionCard({super.key, 
  required this.option, 
  required this.color, 
  });

  final String option;
 // final bool isClicked;
 //final VoidCallback onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: ListTile(
        title: Text(
          option,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 22,
          ),
        ),
      ),
    
    );
  }
}