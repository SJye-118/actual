import 'package:flutter/material.dart';
import 'easy_dic.dart';
import 'medium_dic.dart';
import 'hard_dic.dart';

class DictionaryScreen extends StatelessWidget {
  final String name;
  final String email;
  final int bestScore;

  DictionaryScreen({
    required this.name,
    required this.email,
    required this.bestScore,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dictionary'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center vertically
          crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
          children: [
            SizedBox(
              width: 200, // Set width for uniform size
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EasyDicScreen(),
                    ),
                  );
                },
                child: Text('Easy Dictionary'),
              ),
            ),
            SizedBox(height: 16.0),
            SizedBox(
              width: 200, // Set width for uniform size
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MediumDicScreen(),
                    ),
                  );
                },
                child: Text('Medium Dictionary'),
              ),
            ),
            SizedBox(height: 16.0),
            SizedBox(
              width: 200, // Set width for uniform size
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HardDicScreen(),
                    ),
                  );
                },
                child: Text('Hard Dictionary'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
