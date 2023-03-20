import 'package:commerce_quiz_qpp/constants/constants.dart';
import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({
    Key? key,
    required this.question,
    required this.indexAction,
    required this.totalQuestions
  }) : super(key: key);

  final String question;
  final int indexAction;
  final int totalQuestions;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
          'Question ${indexAction + 1}/$totalQuestions: $question',
        style: TextStyle(
          fontSize: 20.0
        ),
      ),
    );
  }
}
