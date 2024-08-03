import 'package:flutter/material.dart';
import 'level_screen.dart'; // Import the LevelScreen

class DictionaryScreen extends StatelessWidget {
  final String name;
  final String email;
  final String age;
  final int bestScore;

  DictionaryScreen({
    required this.name,
    required this.email,
    required this.age,
    required this.bestScore,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dictionary'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Select Level:',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LevelScreen(
                          name: name,
                          email: email,
                          age: age,
                          bestScore: bestScore,
                          level: 1, // Current quiz questions
                        ),
                      ),
                    );
                  },
                  child: Text('Level 1'),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LevelScreen(
                          name: name,
                          email: email,
                          age: age,
                          bestScore: bestScore,
                          level: 2,
                        ),
                      ),
                    );
                  },
                  child: Text('Level 2'),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LevelScreen(
                          name: name,
                          email: email,
                          age: age,
                          bestScore: bestScore,
                          level: 3,
                        ),
                      ),
                    );
                  },
                  child: Text('Level 3'),
                ),
              ],
            ),
          )),
    );
  }
}
