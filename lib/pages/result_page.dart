import 'package:commerce_quiz_qpp/pages/starting_page.dart';
import 'package:flutter/material.dart';
import 'package:commerce_quiz_qpp/pages/home_screen.dart';
import 'package:commerce_quiz_qpp/constants/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key, required this.total, required this.quesLength,}) : super(key: key);
  final int total;
  final int quesLength;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
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
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //SizedBox(height: 50),
                Text(
                  'Your Score',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple
                  ),
                ),
                SizedBox(height: 50.0),
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.purple,
                      width: 4,
                    ),
                  ),
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '${widget.total}',
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                          TextSpan(
                            text: ' / ${widget.quesLength}',
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: Colors.purple,
                            ),
                          ),
                        ],
                      ),
                    ),

                  ),
                ),
                SizedBox(height: 50),
                SizedBox(
                  height: 50.0,
                  width: 200, // set the desired width here
                  child: ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        Navigator.pushReplacement(
                            context, MaterialPageRoute(builder: (context) => HomePage()));
                      });
                    },
                    icon: FaIcon(FontAwesomeIcons.redo),
                    label: Text(
                      'Play Again',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFB48AD4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  height: 50.0,
                  width: 200, // set the desired width here
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => StartingPage()));
                    },
                    icon: FaIcon(Icons.menu),
                    label: Text(
                      'Back to Menu',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFB48AD4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
