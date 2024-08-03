import 'package:flutter/material.dart';
import 'trivia_screen.dart';
import 'user_profile_screen.dart';
import 'dictionary_screen.dart'; // Import the DictionaryScreen

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
        title: Text('Welcome'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hello, $name!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text('Email: $email', textAlign: TextAlign.center),
              Text('Age: $age', textAlign: TextAlign.center),
              SizedBox(height: 20),
              if (bestScore > 0)
                Text(
                  'Best Score: $bestScore',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              if (isTriviaMaster)
                Text(
                  'Title: Trivia Master',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                  textAlign: TextAlign.center,
                )
              else if (isTriviaNoob)
                Text(
                  'Title: Trivia Noob',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TriviaScreen(
                        name: name,
                        email: email,
                        age: age,
                        bestScore: bestScore,
                        level: 1, // Start quiz at Level 1
                      ),
                    ),
                  );
                },
                child: Text('Start Quiz'),
              ),
              SizedBox(height: 10),
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
                child: Text('View Profile'),
              ),
              SizedBox(height: 10),
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
                child: Text('Dictionary'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
