import 'package:flutter/material.dart';
import 'package:commerce_quiz_qpp/constants/constants.dart';

class OptionCard extends StatelessWidget {
  const OptionCard({
    Key? key,
    required this.option,
    required this.correct,
    required this.pressed,
  }) : super(key: key);

  final String option;
  final bool correct;
  final bool pressed;

  @override
  Widget build(BuildContext context) {
    Color color = normalColor;

    if (pressed) {
      if (correct) {
        color = correctColor;
      } else {
        color = wrongColor;
      }
    }

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: color,
      child: ListTile(
        title: Text(
          option,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14.0,
          ),
        ),
      ),
    );
  }
}
