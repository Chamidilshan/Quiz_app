import 'package:flutter/material.dart';
import 'package:commerce_quiz_qpp/constants/constants.dart';

class OptionCard extends StatelessWidget {
  const OptionCard({Key? key, required this.option, required this.color, required this.onTap}) : super(key: key);

  final String option;
  //final bool isClicked;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: color,
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
      ),
    );
  }
}
