import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key,});
  

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0)
      ),
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: const Text('Next Question',
      textAlign: TextAlign.center,
      ),
    );
  }
}