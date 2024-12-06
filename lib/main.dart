import 'package:flutter/material.dart';
import 'package:quiz3/quiz.dart';
import 'package:quiz3/result.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;
  int _totalScore = 0;

  static final List<Map<String, Object>> _questions = [
    {
      'question': 'What is the capital of France?',
      'answers': [
        {'text': 'Berlin', 'score': 0},
        {'text': 'Madrid', 'score': 0},
        {'text': 'Paris', 'score': 1},
        {'text': 'Rome', 'score': 0},
      ],
    },
    {
      'question': 'Which programming language is used for Flutter?',
      'answers': [
        {'text': 'Java', 'score': 0},
        {'text': 'Dart', 'score': 1},
        {'text': 'Python', 'score': 0},
        {'text': 'C++', 'score': 0},
      ],
    },
    {
      'question': 'Which planet is known as the Red Planet?',
      'answers': [
        {'text': 'Earth', 'score': 0},
        {'text': 'Mars', 'score': 1},
        {'text': 'Jupiter', 'score': 0},
        {'text': 'Venus', 'score': 0},
      ],
    },
    {
      'question': 'What is your favorite programming language?',
      'answers': [
        {'text': 'Python', 'score': 3},
        {'text': 'Java', 'score': 2},
        {'text': 'C++', 'score': 1},
      ],
    },
    {
      'question': 'Which IDE do you prefer?',
      'answers': [
        {'text': 'Visual Studio Code', 'score': 3},
        {'text': 'IntelliJ IDEA', 'score': 2},
        {'text': 'Eclipse', 'score': 1},
      ],
    },
    {
      'question': 'How do you learn new programming skills?',
      'answers': [
        {'text': 'Online Tutorials', 'score': 3},
        {'text': 'Books', 'score': 2},
        {'text': 'In-Person Classes', 'score': 1},
      ],
    },
    {
      'question': 'What is your preferred operating system?',
      'answers': [
        {'text': 'Linux', 'score': 3},
        {'text': 'Windows', 'score': 2},
        {'text': 'MacOS', 'score': 1},
      ],
    },
    {
      'question': 'How do you keep your code organized?',
      'answers': [
        {'text': 'Follow strict conventions', 'score': 3},
        {'text': 'Organize as needed', 'score': 2},
        {'text': 'No special effort', 'score': 1},
      ],
    },
    {
      'question': 'Do you prefer frontend or backend development?',
      'answers': [
        {'text': 'Frontend', 'score': 2},
        {'text': 'Backend', 'score': 3},
        {'text': 'Both equally', 'score': 1},
      ],
    },
    {
      'question': 'How often do you work on personal projects?',
      'answers': [
        {'text': 'Daily', 'score': 3},
        {'text': 'Weekly', 'score': 2},
        {'text': 'Occasionally', 'score': 1},
      ],
    },
  ];


  void _answerPressed(int score) {
    setState(() {
      _totalScore += score;
      _questionIndex++;
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  double _calculateProgress() {
    return _questionIndex / _questions.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.light(
          primary: Colors.teal,
          secondary: Colors.tealAccent,
          surface: Colors.white,
          background: Colors.grey[100]!,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal[300],
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        appBarTheme: AppBarTheme(
          elevation: 1,
          backgroundColor: Colors.white,
          foregroundColor: Colors.teal[800],
          centerTitle: true,
        ),
      ),
      home: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          title: const Text(
            "Personal Preference Quiz",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(10),
            child: LinearProgressIndicator(
              value: _calculateProgress(),
              backgroundColor: Colors.teal[100],
              valueColor: AlwaysStoppedAnimation<Color>(
                _calculateProgress() < 1 ? Colors.teal : Colors.green,
              ),
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white,
                Colors.teal[50]!,
              ],
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  _questionIndex < _questions.length
                      ? 'Question ${_questionIndex + 1} of ${_questions.length}'
                      : 'Quiz Completed',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal[800],
                  ),
                ),
              ),
              Expanded(
                child: _questionIndex < _questions.length
                    ? Quiz(
                  questionIndex: _questionIndex,
                  questions: _questions,
                  answerQuestion: _answerPressed,
                )
                    : Result(_totalScore, _resetQuiz),
              ),
            ],
          ),
        ),
      ),
    );
  }
}