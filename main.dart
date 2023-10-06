import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  Map<String, String> questions = {
    'What is the capital of France?': 'Paris',
    'Which planet is known as the Red Planet?': 'Mars',
    'What is the largest mammal in the world?': 'Blue whale',
    'How many continents are there on Earth?': '7',
    'What is the national flower of Japan?': 'Cherry blossom',
    // Add more questions here
  };

  List<int> randList = [];

  int currentQuestionIndex = 0;
  int correctAnswers = 0;
  double percentage = 0.0;

  @override
  void initState() {
    super.initState();
    generateRandomNumbers();
  }



  void nextQuestion() {
    if (currentQuestionIndex < randList.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      calculatePercentage();
    }
  }

  void calculatePercentage() {
    percentage = (correctAnswers / randList.length) * 100;
  }

  void resetQuiz() {
    setState(() {
      currentQuestionIndex = 0;
      correctAnswers = 0;
      percentage = 0.0;
      generateRandomNumbers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Question ${currentQuestionIndex + 1} / ${randList.length}',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 10.0),
            Text(
              questions.keys.elementAt(randList[currentQuestionIndex]),
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                checkAnswer('Paris'); // Replace with user input handling
                nextQuestion();
              },
              child: Text('Option 1'), // Replace with your answer choices
            ),
            ElevatedButton(
              onPressed: () {
                checkAnswer('Mars'); // Replace with user input handling
                nextQuestion();
              },
              child: Text('Option 2'), // Replace with your answer choices
            ),
            SizedBox(height: 20.0),
            Text(
              'Total Correct Answers: $correctAnswers',
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              'Percentage Correct: $percentage%',
              style: TextStyle(fontSize: 20.0),
            ),
            if (percentage > 50) Text('Congratulations!'),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: resetQuiz,
              child: Text('Restart Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
