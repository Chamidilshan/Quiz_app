import 'package:commerce_quiz_qpp/constants/constants.dart';
import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  const NextButton({Key? key, required this.pressed}) : super(key: key);

  final bool pressed;

  @override
  Widget build(BuildContext context) {

    Color color =  Color(0xFFB48AD4);

    if(pressed){
      color = backColor;
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Text(
          'Next Question',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
