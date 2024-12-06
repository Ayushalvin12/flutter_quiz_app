import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final Function() resetData;

  const Result(this.score, this.resetData, {Key? key}) : super(key: key);

  String get resultPhrase {
    if (score >= 6) return 'You are techno savvy!';
    if (score >= 5) return 'You are neutral!';
    return "You have technophobia!";
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            resultPhrase,
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: resetData,
            child: const Text("Restart Quiz"),
          ),
        ],
      ),
    );
  }
}
