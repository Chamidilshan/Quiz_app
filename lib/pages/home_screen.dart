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
              duration: Duration(milliseconds: 800),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)
              ),
              content: Text('Please select a anwser'),
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.symmetric(vertical: 90.0, horizontal: 90.0),
              backgroundColor: Colors.purple.withOpacity(0.8),
            )
        );
      } else{
        setState(() {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ResultScreen(total: score, quesLength: questionLength)));
        });
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
              duration: Duration(milliseconds: 800),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)
              ),
              content: Text('Please select a anwser'),
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.symmetric(vertical: 160.0, horizontal: 120.0),
              backgroundColor: Colors.purple.withOpacity(0.8),
            )
        );
      }
    }
  }

  void checkAndUpdate(bool value, int index) {
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
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFE7C9FF),
                    Color(0xFFFFDBFF),
                    Color(0xFFDFB7FE),
                    Color(0xFFECCFFD),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),),
              child: Scaffold(
                body: SafeArea(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFE7C9FF),
                          Color(0xFFFFDBFF),
                          Color(0xFFDFB7FE),
                          Color(0xFFECCFFD),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40.0,
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(20.0),
                          child: Container(
                            padding: EdgeInsets.all(20.0),
                            color: Colors.white,
                            height: 480.0,
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
                                        i // pass the index of the selected option
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
                            child: NextButton(pressed: isPressed),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        // TextButton(
                        //     onPressed: () {},
                        //     child: Text('Submit')
                        // ),
                      ],
                    ),
                  ),
                ),


                floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
                floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
              ),
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

