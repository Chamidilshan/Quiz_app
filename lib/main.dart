import 'package:commerce_quiz_qpp/models/database.dart';
import 'package:commerce_quiz_qpp/pages/home_screen.dart';
import 'package:commerce_quiz_qpp/pages/starting_page.dart';
import 'package:flutter/material.dart';
import 'models/question_model.dart';
import 'models/database.dart';

void main() {

  var db = DBconnect();
  // db.addQuestion(
  //   Question(
  //       id: '20',
  //       text: 'What is 20 + 20',
  //       options: {
  //         '100' : false,
  //         '200' : false,
  //         '300' : false,
  //         '400' : true,
  //       }
  //   )
  // );
   db.fetchQuestions();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

