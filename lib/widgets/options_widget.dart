import 'package:flutter/material.dart';

class OptionCard extends StatelessWidget {
  const OptionCard({Key? key, required this.option}) : super(key: key);

  final String option;

  @override
  Widget build(BuildContext context) {
    return Card(
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
