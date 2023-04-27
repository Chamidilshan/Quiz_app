import 'package:commerce_quiz_qpp/models/database.dart';
import 'package:commerce_quiz_qpp/pages/starting_page.dart';
import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash_web.dart';
import 'models/question_model.dart';
import 'models/database.dart';

void main() {

  var db = DBconnect();
   db.fetchQuestions();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ConnectivityAppWrapper(
      app: MaterialApp(
        title: 'Quiz App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: StartingPage(),
      ),
    );
  }
}

