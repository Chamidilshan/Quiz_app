import 'package:commerce_quiz_qpp/constants/constants.dart';
import 'package:commerce_quiz_qpp/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StartingPage extends StatelessWidget {
  const StartingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // GestureDetector(
          //   onTap: () {
          //     print('pressed lessons');
          //   },
          //   child: Card(
          //     margin: EdgeInsets.symmetric(horizontal: 120.0),
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(20.0)
          //     ),
          //     color: backColor,
          //     child: Container(
          //       child: Row(
          //         children: [
          //           FaIcon(FontAwesomeIcons.bookSkull),
          //           ListTile(
          //             title: Text(
          //               'Theory Lessons',
          //               textAlign: TextAlign.center,
          //               style: TextStyle(
          //                 color: Colors.white
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          SizedBox(
            height: 20.0,
          ),
          GestureDetector(
            onTap: () {
              print('pressed quiz');
              Navigator.push(
                  context, MaterialPageRoute(
                  builder: (context) => HomePage()
              )
              );
            },
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 100.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)
              ),
              color: backColor,
              child: Container(
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 20.0,
                      ),
                      FaIcon(FontAwesomeIcons.book, color: Colors.white.withOpacity(0.8),),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        'Start Quiz',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          GestureDetector(
            onTap: () {
              print('pressed lessons');
            },
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 100.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)
              ),
              color: backColor,
              child: Container(
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 20.0,
                      ),
                      FaIcon(FontAwesomeIcons.champagneGlasses, color: Colors.white.withOpacity(0.8),),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        'Video Lessons',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          GestureDetector(
            onTap: () {
              print('pressed lessons');
            },
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 100.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)
              ),
              color: backColor,
              child: Container(
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 20.0,
                      ),
                      FaIcon(FontAwesomeIcons.bookOpen, color: Colors.white.withOpacity(0.8),),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        'Exam Questions',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          GestureDetector(
            onTap: () {
              print('pressed lessons');
            },
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 100.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)
              ),
              color: backColor,
              child: Container(
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 20.0,
                      ),
                      FaIcon(FontAwesomeIcons.contactCard, color: Colors.white.withOpacity(0.8),),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        'Connect with us',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
