import 'package:flutter/material.dart';

class Question{
  final String id;
  final String text;
  final Map<String, bool> options;

  Question({
    required this.id,
    required this.text,
    required this.options,
  });
  @override
  String toString() {
    return 'Question(id: $id, title: $text, options: $options)';
  }
}



