import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function() answerPressed;
  final String answer;

  const Answer(this.answerPressed, this.answer, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ElevatedButton(
        onPressed: answerPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        child: Text(answer),
      ),
    );
  }
}