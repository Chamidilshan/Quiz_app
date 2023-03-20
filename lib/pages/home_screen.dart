import 'package:commerce_quiz_qpp/widgets/question_widget.dart';
import 'package:flutter/material.dart';
import 'package:commerce_quiz_qpp/constants/constants.dart';
import 'package:commerce_quiz_qpp/models/question_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int index = 0;

  List<Question> _qestions = [
    Question(
        id: '10',
        text: 'A business can be identified as any activity which satisfies '
            'human needs and wants. Wants are created by businessmen. Accordingly, '
            'main characteristic of a need is,',
        options: {
          'Being complex and‘diverse.' : false,
          'Created by businessmen.' : false,
          'Common to all' : false,
          'Being unlimited and unsatisfied' : true
        }
    ),
    Question(
        id: '11',
        text: 'The difference between goods and services can be identified',
        options: {
          'on price' : false,
          'on demand' : false,
          'on supply' : true,
          'on supply' : false
        }
    ),
    Question(
        id: '13',
        text: 'Which of the following is not considered as a product?',
        options: {
          'Time' : false,
          'Goods' : false,
          'Services' : false,
          'Ideas' : true
        }
    ),
    Question(
        id: '13',
        text: 'Today business activities are carried out without the physical identified place. What is the main facility yse for this?',
        options: {
          'Telephone .' : false,
          'Telephone .' : false,
          'internet' : true,
          'ideas' : false
        }
    ),
    Question(
        id: '14',
        text: 'Who take the correct decision with regard to implementation of business plan?',
        options: {
          'Owners' : false,
          'Suppliers' : false,
          'Office employees' : false,
          'Managers' : true
        }
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backColor,
        shadowColor: Colors.transparent,
        title: Text(
          'Commerce Quiz App'
        ),
      ),
      backgroundColor: backColor,
      body: Container(
        color: normalColor,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            QuestionWidget(
                question: _qestions[index].text,
                indexAction: index,
                totalQuestions: _qestions.length
            ),
            Divider(color: backColor,)
          ],
        ),
      ),
    );
  }
}
