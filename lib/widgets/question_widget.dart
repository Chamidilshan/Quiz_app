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
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  'Question ${indexAction + 1}/$totalQuestions ',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black
                ),
              ),
            ],
          ),
          SizedBox(
            height: 28.0,
          ),
          Text('$question',
            style: TextStyle(
                fontSize: 22.0,
              color: Colors.black,
            ),
          )
        ],
      ),

    );
  }
}
