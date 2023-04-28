import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:commerce_quiz_qpp/constants/constants.dart';
import 'package:commerce_quiz_qpp/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StartingPage extends StatelessWidget {
  const StartingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeAnimation(
        duration: Duration(milliseconds: 2000),
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
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20.0,
              ),
              Image.asset('images/books.png', width: 290.0,),
              SizedBox(height: 20.0),
              Expanded(
                child: Column(
                  children: [
                    _buildButton(
                      icon: FontAwesomeIcons.book,
                      label: 'Start Quiz',
                      color: backColor,
                      onPressed: () {
                        print('pressed quiz');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 20.0),
                    _buildButton(
                      icon: FontAwesomeIcons.champagneGlasses,
                      label: 'Video Lessons',
                      color: backColor.withOpacity(0.5),
                      onPressed: () {
                        print('pressed lessons');
                      },
                    ),
                    SizedBox(height: 20.0),
                    _buildButton(
                      icon: FontAwesomeIcons.bookOpen,
                      label: 'Exam Questions',
                      color: backColor.withOpacity(0.5),
                      onPressed: () {
                        print('pressed questions');
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    _buildButton(
                      icon: FontAwesomeIcons.book,
                      label: 'Connect with us',
                      color: backColor.withOpacity(0.5),
                      onPressed: () {
                        print('pressed quiz');
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 80.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return Flexible(
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 90.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: color,
        child: InkWell(
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FaIcon(icon, color: Colors.white.withOpacity(0.8)),
                SizedBox(width: 10.0),
                Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
