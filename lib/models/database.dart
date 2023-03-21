import 'dart:convert';

import 'package:commerce_quiz_qpp/models/question_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class DBconnect{
  
  final url = Uri.parse('https://commercequizapp-default-rtdb.asia-southeast1.firebasedatabase.app/qustions1.json');
  Future<void> addQuestion(Question question) async{
    http.post(url, body: json.encode({
      'text': question.text,
      'options': question.options
    }));
  }

  Future<void> fetchQuestions() async{
    http.get(url).then((response){
      var data = json.decode(response.body);
      print(data);
    });
  }
}

