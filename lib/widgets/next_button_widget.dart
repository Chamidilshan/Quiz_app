import 'package:commerce_quiz_qpp/constants/constants.dart';
import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  const NextButton({Key? key, required this.nextQuestion}) : super(key: key);

  final VoidCallback nextQuestion;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: nextQuestion,
      child: Container(
        decoration: BoxDecoration(
          color: normalColor,
          borderRadius: BorderRadius.circular(20.0)
        ),
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Text(
          'Next Question',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
