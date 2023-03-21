import 'package:commerce_quiz_qpp/constants/constants.dart';
import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  const NextButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
