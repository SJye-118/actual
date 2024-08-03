import 'package:flutter/material.dart';
import 'welcome_screen.dart';
import 'dictionary_screen.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _ageController = TextEditingController();

  void _submit() {
    final name = _nameController.text;
    final email = _emailController.text;
    final age = _ageController.text;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WelcomeScreen(
          name: name,
          email: email,
          age: age,
          bestScore: 0, // Initialize best score to 0
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: _ageController,
              decoration: InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submit,
              child: Text('Create Profile'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                final name = _nameController.text; // Retrieve name
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DictionaryScreen(name: name),
                  ),
                );
              },
              child: Text('About the Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
