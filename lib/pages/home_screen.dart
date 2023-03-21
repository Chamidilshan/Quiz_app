import 'package:commerce_quiz_qpp/widgets/next_button_widget.dart';
import 'package:commerce_quiz_qpp/widgets/options_widget.dart';
import 'package:commerce_quiz_qpp/widgets/question_widget.dart';
import 'package:flutter/material.dart';
import 'package:commerce_quiz_qpp/constants/constants.dart';
import 'package:commerce_quiz_qpp/models/question_model.dart';
import 'package:commerce_quiz_qpp/models/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  var db = DBconnect();
  late Future _questions;
  
  Future<List<Question>> getData() async{
    return db.fetchQuestions();
  }
  
  @override
  void initState() {
    _questions = getData();
    super.initState();
  }
  
  int index = 0;
  bool isPressed = false;
  int score = 0;
  bool isAlreadySelected = false;

  void showNextQuestion(int questionLength){
    if(index + 1 == questionLength){
      showDialog(context: context, builder: (ctx) => AlertDialog(
        backgroundColor: backColor,
        content: Padding(
          padding: const EdgeInsets.all(80.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  'Total Score: $score',
                style:  TextStyle(
                  color: Colors.white
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextButton(
                onPressed: startOver,
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green
                ),
                child: Text(
                    'Start Again',
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
              )
            ],
          ),
        ),
      ));
    } else{
      if(isPressed){
        setState(() {
          index++;
          isPressed = false;
        });
      } else{
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Please select a anwser'),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.symmetric(vertical: 20.0),
            backgroundColor: backColor,
          )
        );
      }
    }
  }

  void checkAndUpdate(bool value) {
    if (isAlreadySelected) {
      return;
    } else {
      if (value == true) {
        score++;
        setState(() {
          isPressed = true;
          isAlreadySelected = false;
        });
      } else if (value == false) {
        setState(() {
          isPressed = true;
          isAlreadySelected = false;
        });
      }
    }
  }

  void startOver() {
    setState(() {
      index = 0;
      score = 0;
      isPressed = false;
      isAlreadySelected = false;
    });
    Navigator.pop(context);
  }
  // List<Question> _questions = [
  //   Question(
  //       id: '10',
  //       text: 'A business can be identified as any activity which satisfies '
  //           'human needs and wants. Wants are created by businessmen. Accordingly, '
  //           'main characteristic of a need is,',
  //       options: {
  //         'Being complex and‘diverse.' : false,
  //         'Created by businessmen.' : false,
  //         'Common to all' : false,
  //         'Being unlimited and unsatisfied' : true
  //       }
  //   ),
  //   Question(
  //       id: '11',
  //       text: 'The difference between goods and services can be identified',
  //       options: {
  //         'on price' : false,
  //         'on demand' : false,
  //         'on supply' : true,
  //         'on hire' : false
  //       }
  //   ),
  //   Question(
  //       id: '13',
  //       text: 'Which of the following is not considered as a product?',
  //       options: {
  //         'Time' : false,
  //         'Goods' : false,
  //         'Services' : false,
  //         'Ideas' : true
  //       }
  //   ),
    // Question(
    //     id: '13',
    //     text: 'Today business activities are carried out without the physical identified place. What is the main facility yse for this?',
    //     options: {
    //       'Telephone .' : false,
    //       'Mobile' : false,
    //       'internet' : true,
    //       'ideas' : false
    //     }
    // ),
    // Question(
    //     id: '14',
    //     text: 'Who take the correct decision with regard to implementation of business plan?',
    //     options: {
    //       'Owners' : false,
    //       'Suppliers' : false,
    //       'Office employees' : false,
    //       'Managers' : true
    //     }
    // )
  // ];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _questions as Future<List<Question>>,
      builder: (ctx, snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          if(snapshot.hasError){
            return Center(
              child: Text('${snapshot.error}'),
            );
          }else if(snapshot.hasData){
            var extractedData = snapshot.data as List<Question>;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: backColor,
                shadowColor: Colors.transparent,
                title: Text(
                    'Commerce Quiz App'
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'Score: $score',
                      style: TextStyle(
                          fontSize: 14.0
                      ),
                    ),
                  )
                ],
              ),
              backgroundColor: backColor,
              body: Container(
                color: normalColor,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    QuestionWidget(
                        question: extractedData[index].text,
                        indexAction: index,
                        totalQuestions: extractedData.length
                    ),
                    //Divider(color: Colors.black,),
                    SizedBox(
                      height: 25.0,
                    ),
                    for(int i=0; i<extractedData[index].options.length; i++)
                      GestureDetector(
                        onTap: () => checkAndUpdate(extractedData[index].options.values.toList()[i]),
                        child: OptionCard(
                          option: extractedData[index].options.keys.toList()[i],
                          color: isPressed ? extractedData[index].options.values.toList()[i] == true ?
                          correctColor : normalColor : normalColor,
                        ),
                      )
                  ],
                ),
              ),

              floatingActionButton: GestureDetector(
                onTap: () => showNextQuestion(extractedData.length),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: NextButton(),
                ),
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
              floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
            );
          }
          else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }
        return Center(
          child: Text('No data'),
        );
      },
    );
  }
}
