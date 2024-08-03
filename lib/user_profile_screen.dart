import 'package:flutter/material.dart';
import 'welcome_screen.dart';

class UserProfileScreen extends StatefulWidget {
  final String name;
  final String email;
  final String age;
  final int bestScore;

  UserProfileScreen({
    required this.name,
    required this.email,
    required this.age,
    required this.bestScore,
  });

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _ageController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.name);
    _emailController = TextEditingController(text: widget.email);
    _ageController = TextEditingController(text: widget.age);
  }

  @override
  Widget build(BuildContext context) {
    final isTriviaMaster = widget.name.startsWith('Trivia Master');
    final isTriviaNoob = widget.name.startsWith('Trivia Noob');

    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextFormField(
                controller: _ageController,
                decoration: InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              Text(
                'Best Score: ${widget.bestScore}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              if (isTriviaMaster)
                Text(
                  'Title: Trivia Master',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                )
              else if (isTriviaNoob)
                Text(
                  'Title: Trivia Noob',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  var updatedName = _nameController.text;
                  if (isTriviaMaster &&
                      !updatedName.startsWith('Trivia Master')) {
                    updatedName = 'Trivia Master $updatedName';
                  } else if (isTriviaNoob &&
                      !updatedName.startsWith('Trivia Noob')) {
                    updatedName = 'Trivia Noob $updatedName';
                  } else if (!isTriviaMaster &&
                      !isTriviaNoob &&
                      updatedName.startsWith('Trivia Master')) {
                    updatedName =
                        updatedName.replaceFirst('Trivia Master ', '');
                  } else if (!isTriviaMaster &&
                      !isTriviaNoob &&
                      updatedName.startsWith('Trivia Noob')) {
                    updatedName = updatedName.replaceFirst('Trivia Noob ', '');
                  }
                  final updatedEmail = _emailController.text;
                  final updatedAge = _ageController.text;
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WelcomeScreen(
                        name: updatedName,
                        email: updatedEmail,
                        age: updatedAge,
                        bestScore: widget.bestScore,
                      ),
                    ),
                    (Route<dynamic> route) => false,
                  );
                },
                child: Text('Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
