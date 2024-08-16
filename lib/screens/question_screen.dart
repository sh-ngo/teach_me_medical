import 'package:flutter/material.dart';
import '../models/question.dart';

class QuestionScreen extends StatelessWidget {
  final List<Question> questions;
  final int questionIndex;
  final Function(int) addUserAnswer;

  const QuestionScreen({
    super.key,
    required this.questions,
    required this.questionIndex,
    required this.addUserAnswer,
  });

  @override
  Widget build(BuildContext context) {
    final question = questions[questionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('Question ${questionIndex + 1}'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(question.questionText, style: const TextStyle(fontSize: 24, color: Colors.white)),
              const SizedBox(height: 20),
              ...question.options.asMap().entries.map((entry) {
                int idx = entry.key;
                String option = entry.value;
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ElevatedButton(
                    child: Text(option),
                    onPressed: () {
                      addUserAnswer(idx);
                    },
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
