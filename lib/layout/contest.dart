import 'package:flutter/material.dart';
import 'package:learn_program/quiz/Screen/quiz_screen.dart';
import 'package:learn_program/layout/contest/lang_list.dart';
class contest extends StatefulWidget {
  const contest({super.key});

  @override
  State<contest> createState() => _contestState();
}

class _contestState extends State<contest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: langlist(),
    // body: QuizScreen(),
    );
  }
}
