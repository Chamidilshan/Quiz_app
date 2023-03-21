import 'dart:convert';

import 'package:commerce_quiz_qpp/models/question_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DBconnect {
  final url =
  Uri.parse('https://commercequizapp-default-rtdb.asia-southeast1.firebasedatabase.app/qustions1.json');

  Future<void> addQuestion(Question question) async {
    http.post(url,
        body: json.encode({'text': question.text, 'options': question.options}));
  }

  Future<List<Question>> fetchQuestions() async {
    final response = await http.get(url);
    if (response.statusCode != 200) {
      throw Exception('Failed to fetch questions');
    }

    final Map<String, dynamic>? data = json.decode(response.body);
    if (data == null) {
      throw Exception('No data found');
    }

    final List<Question> newQuestions = [];
    data.forEach((key, value) {
      final newQuestion = Question(
        id: key,
        text: value['text'] ?? '',
        options: Map.castFrom(value['options'] ?? {}),
      );
      newQuestions.add(newQuestion);
    });
    return newQuestions;
  }
}
