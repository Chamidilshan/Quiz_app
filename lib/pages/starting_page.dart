import 'package:commerce_quiz_qpp/constants/constants.dart';
import 'package:commerce_quiz_qpp/pages/home_screen.dart';
import 'package:flutter/material.dart';

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
          GestureDetector(
            onTap: () {
              print('pressed lessons');
            },
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 120.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)
              ),
              color: Colors.lightBlue,
              child: Container(
                child: ListTile(
                  title: Text(
                    'Theory Lessons',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white
                    ),
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
              print('pressed quiz');
              Navigator.push(
                  context, MaterialPageRoute(
                  builder: (context) => HomePage()
              )
              );
            },
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 120.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)
              ),
              color: Colors.lightBlue,
              child: Container(
                child: ListTile(
                  title: Text(
                    'Start Quiz',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
}
