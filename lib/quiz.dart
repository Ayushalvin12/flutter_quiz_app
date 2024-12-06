import 'package:flutter/material.dart';
import 'package:quiz3/answer.dart';
import 'package:quiz3/question.dart';

class Quiz extends StatelessWidget {
  final int questionIndex;
  final List<Map<String, Object>> questions;
  final Function(int) answerQuestion;

  const Quiz({
    Key? key,
    required this.questionIndex,
    required this.questions,
    required this.answerQuestion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Question(questions[questionIndex]['question'] as String),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) => Answer(
              () => answerQuestion(answer['score'] as int),
          answer['text'] as String,
        ))
            .toList(),
      ],
    );
  }
}
