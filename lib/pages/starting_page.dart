import 'package:commerce_quiz_qpp/constants/constants.dart';
import 'package:commerce_quiz_qpp/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StartingPage extends StatelessWidget {
  const StartingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset('images/books.png', width: 290.0,),
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
                margin: EdgeInsets.symmetric(horizontal: 90.0),
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
                margin: EdgeInsets.symmetric(horizontal: 90.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)
                ),
                color: backColor.withOpacity(0.7),
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
                margin: EdgeInsets.symmetric(horizontal: 90.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)
                ),
                color: backColor.withOpacity(0.7),
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
            ElevatedButton(
                onPressed: (){},
                child: Text('Connect with us'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0)
              ),
            ),
            SizedBox(
              height: 80.0,
            )

          ],
        ),
      ),
    );
  }
}
