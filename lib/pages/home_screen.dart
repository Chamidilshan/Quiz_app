import 'package:commerce_quiz_qpp/pages/result_page.dart';
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
  String? selectedOption;

  void showNextQuestion(int questionLength){
    if(index + 1 == questionLength){
      if(isPressed == false){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Please select a anwser'),
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.symmetric(vertical: 20.0),
              backgroundColor: backColor,
            )
        );
      } else{
       setState(() {
         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ResultScreen(total: score, quesLength: questionLength)));
       });
        // showDialog(context: context, builder: (ctx) => AlertDialog(
        //   backgroundColor: backColor,
        //   content: Padding(
        //     padding: const EdgeInsets.all(80.0),
        //     child: Column(
        //       mainAxisSize: MainAxisSize.min,
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         Text(
        //           'Total Score: $score',
        //           style:  TextStyle(
        //               color: Colors.white
        //           ),
        //         ),
        //         SizedBox(
        //           height: 20.0,
        //         ),
        //         TextButton(
        //           onPressed: startOver,
        //           style: TextButton.styleFrom(
        //               backgroundColor: Colors.green
        //           ),
        //           child: Text(
        //             'Start Again',
        //             style: TextStyle(
        //                 color: Colors.white
        //             ),
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        // ));
      }
    } else{
      // setState(() {
      //   isPressed = false;
      // });
      if(isPressed){
        setState(() {
          index++;
          isPressed = false;
          isAlreadySelected = false;
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
          isAlreadySelected = true;
        });
      } else if (value == false) {
        setState(() {
          isPressed = true;
          isAlreadySelected = true;
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
              backgroundColor: Colors.white,
              // appBar: AppBar(
              //   backgroundColor: backColor,
              //   title: Text(
              //       'Commerce Quiz App'
              //   ),
              //   actions: [
              //   ],
              //   centerTitle: true,
              // ),
              body: SafeArea(
                child: Column(
                  children: [
                    SizedBox(
                      height: 40.0,
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(20.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Color(0xFFB38BD4)
                        ),
                        padding: EdgeInsets.all(20.0),
                        height: 440.0,
                        child: Column(
                          children: [
                            QuestionWidget(
                                question: extractedData[index].text,
                                indexAction: index,
                                totalQuestions: extractedData.length
                            ),
                            //Divider(color: Colors.black,),
                            SizedBox(
                              height: 28.0,
                            ),
                            for (int i = 0;
                            i < extractedData[index].options.length;
                            i++)
                              GestureDetector(
                                onTap: () => checkAndUpdate(
                                  extractedData[index].options.values.toList()[i] == true,
                                ),
                                child: OptionCard(
                                  option: extractedData[index].options.keys.toList()[i],
                                  pressed: isPressed ? true : false,
                                  correct: extractedData[index].options.values.toList()[i],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
               SizedBox(
                 height: 20.0,
               ),
               GestureDetector(
                      onTap: () => showNextQuestion(extractedData.length),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: NextButton(),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Score: $score',
                      style: TextStyle(
                          fontSize: 14.0
                      ),
                    ),
                  ],
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
          child: CircularProgressIndicator(color: backColor)
        );
      },
    );
  }
}


