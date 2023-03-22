import 'package:flutter/material.dart';
import 'package:commerce_quiz_qpp/constants/constants.dart';

class OptionCard extends StatelessWidget {
  const OptionCard({Key? key, required this.option, required this.color}) : super(key: key);

  final String option;
  //final bool isClicked;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0)
      ),
      color: Colors.white,
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
