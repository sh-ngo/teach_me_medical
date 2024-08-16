import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Image.asset('assets/images/logo.png', height: 150),
              const SizedBox(height: 20),
              // Text
              const Text(
                'Learn your lab tests the fun way',
                style: TextStyle(fontSize: 24, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              // Start Quiz Button
              ElevatedButton(
                child: const Text('Start Quiz'),
                onPressed: () {
                  Navigator.pushNamed(context, '/question/0');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
