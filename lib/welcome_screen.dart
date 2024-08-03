import 'package:flutter/material.dart';
import 'trivia_screen.dart';
import 'user_profile_screen.dart';
import 'dictionary_screen.dart';

class WelcomeScreen extends StatelessWidget {
  final String name;
  final String email;
  final String age;
  final int bestScore;

  WelcomeScreen({
    required this.name,
    required this.email,
    required this.age,
    required this.bestScore,
  });

  @override
  Widget build(BuildContext context) {
    final isTriviaMaster = name.startsWith('Trivia Master');
    final isTriviaNoob = name.startsWith('Trivia Noob');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hello, $name!',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text('Email: $email', textAlign: TextAlign.center),
              Text('Age: $age', textAlign: TextAlign.center),
              const SizedBox(height: 20),
              if (bestScore > 0)
                Text(
                  'Best Score: $bestScore',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              if (isTriviaMaster)
                const Text(
                  'Title: Trivia Master',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                  textAlign: TextAlign.center,
                )
              else if (isTriviaNoob)
                const Text(
                  'Title: Trivia Noob',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _showLevelSelection(context);
                },
                child: const Text('Start Quiz'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserProfileScreen(
                        name: name,
                        email: email,
                        age: age,
                        bestScore: bestScore,
                      ),
                    ),
                  );
                },
                child: const Text('View Profile'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DictionaryScreen(
                        name: name,
                        email: email,
                        age: age,
                        bestScore: bestScore,
                      ),
                    ),
                  );
                },
                child: const Text('Dictionary'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showLevelSelection(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Select Level'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TriviaScreen(
                        name: name,
                        email: email,
                        age: age,
                        bestScore: bestScore,
                        level: 1,
                        difficulty: 'easy',
                      ),
                    ),
                  );
                },
                child: const Text('Level 1 (Easy)'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TriviaScreen(
                        name: name,
                        email: email,
                        age: age,
                        bestScore: bestScore,
                        level: 2,
                        difficulty: 'medium',
                      ),
                    ),
                  );
                },
                child: const Text('Level 2 (Medium)'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TriviaScreen(
                        name: name,
                        email: email,
                        age: age,
                        bestScore: bestScore,
                        level: 3,
                        difficulty: 'hard',
                      ),
                    ),
                  );
                },
                child: const Text('Level 3 (Hard)'),
              ),
            ],
          ),
        );
      },
    );
  }
}
