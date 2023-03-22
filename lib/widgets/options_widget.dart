import 'package:flutter/material.dart';
import 'package:commerce_quiz_qpp/constants/constants.dart';

class OptionCard extends StatelessWidget {
  const OptionCard({Key? key, required this.option, required this.correct, required this.pressed}) : super(key: key);

  final String option;
  //final bool pressed;
  final bool correct;
  final bool pressed;


  //final bool isClicked;
  //final Color color;
  @override
  Widget build(BuildContext context) {
    final colorNew = pressed ? (correct ? correctColor : wrongColor) : normalColor; // updated logic for color

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0)
      ),
      color: colorNew,
      child: ListTile(
        title:(
            Text(
              option,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.0,
              ),
            )
        ),
      ),
    );
  }
}
