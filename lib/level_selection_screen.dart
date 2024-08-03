import 'package:flutter/material.dart';
import 'trivia_screen.dart';

class LevelSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Quiz Level'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TriviaScreen(
                      name: 'User', // Pass relevant user details here
                      email: '',
                      age: '',
                      bestScore: 0,
                      level: 1, // Level 1
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
                    builder: (context) => TriviaScreen(
                      name: 'User', // Pass relevant user details here
                      email: '',
                      age: '',
                      bestScore: 0,
                      level: 2, // Level 2
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
                    builder: (context) => TriviaScreen(
                      name: 'User', // Pass relevant user details here
                      email: '',
                      age: '',
                      bestScore: 0,
                      level: 3, // Level 3
                    ),
                  ),
                );
              },
              child: Text('Level 3'),
            ),
          ],
        ),
      ),
    );
  }
}
