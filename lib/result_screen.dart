import 'package:flutter/material.dart';
import 'welcome_screen.dart';

class ResultScreen extends StatelessWidget {
  final int correctAnswers;
  final int totalQuestions;
  final String name;
  final String email;
  final String age;
  final int bestScore;

  ResultScreen({
    required this.correctAnswers,
    required this.totalQuestions,
    required this.name,
    required this.email,
    required this.age,
    required this.bestScore,
  });

  @override
  Widget build(BuildContext context) {
    final isTriviaMaster = correctAnswers == totalQuestions;
    final isTriviaNoob = !isTriviaMaster;
    final updatedName = isTriviaMaster
        ? (name.startsWith('Trivia Master') ? name : 'Trivia Master $name')
        : (name.startsWith('Trivia Noob') ? name : 'Trivia Noob $name');

    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Results'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You got $correctAnswers out of $totalQuestions correct!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              if (isTriviaMaster)
                Text(
                  'Congratulations! You are a Trivia Master!',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                  textAlign: TextAlign.center,
                )
              else if (isTriviaNoob)
                Text(
                  'Don\'t worry, you can do better next time!',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WelcomeScreen(
                        name: updatedName,
                        email: email,
                        age: age,
                        bestScore: correctAnswers > bestScore
                            ? correctAnswers
                            : bestScore,
                      ),
                    ),
                    (Route<dynamic> route) => false,
                  );
                },
                child: Text('Back to Welcome Screen'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
