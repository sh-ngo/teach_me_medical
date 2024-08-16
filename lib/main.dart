import 'package:flutter/material.dart';
import 'screens/start_screen.dart';
import 'screens/question_screen.dart';
import 'screens/result_screen.dart';
import 'models/question.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  final List<Question> questions = [
    Question(
      questionText: 'Which of the following are symptoms of anxiety disorders?',
      options: [
        'All of the above',
        'Feeling nervous, restless or tense',
        'Trouble concentrating or thinking about anything other than the present worry',
        'Having a sense of impending danger, panic or doom',
      ],
      correctOptionIndex: 0,
    ),
    Question(
      questionText: 'Which of the following is a symptom of Agoraphobia (Fear of trapped)?',
      options: [
        'fear of being in places where you might feel trapped or helpless, like a crowded mall',
        'repeated episodes of intense anxiety and fear that reach a peak within minutes',
        'consistent failure of children to speak in certain situation',
        'anxiety, fear and avoidance of social situations',
      ],
      correctOptionIndex: 0,
    ),
    Question(
      questionText: 'Which of the following is a symptom of panic attacks?',
      options: [
        'repeated episodes of intense anxiety and fear that reach a peak within minutes',
        'fear of being in places where you might feel trapped or helpless, like a crowded mall',
        'consistent failure of children to speak in certain situation',
        'anxiety, fear and avoidance of social situations',
      ],
      correctOptionIndex: 0,
    ),
    Question(
      questionText: 'Which of the following is a symptom of selective mutism?',
      options: [
        'consistent failure of children to speak in certain situation',
        'repeated episodes of intense anxiety and fear that reach a peak within minutes',
        'anxiety, fear and avoidance of social situations',
        'fear of being in places where you might feel trapped or helpless, like a crowded mall',
      ],
      correctOptionIndex: 0,
    ),
    Question(
      questionText: 'Which of the following is a symptom of social phobia?',
      options: [
        'anxiety, fear and avoidance of social situations',
        'repeated episodes of intense anxiety and fear that reach a peak within minutes',
        'fear of being in places where you might feel trapped or helpless, like a crowded mall',
        'consistent failure of children to speak in certain situation',
      ],
      correctOptionIndex: 0,
    ),
    Question(
      questionText: 'Which of the following is a symptom of Substance-induced anxiety disorder.',
      options: [
        'intense anxiety of misusing drugs, taking medications, being exposed to a toxic substance',
        'consistent failure of children to speak in certain situation',
        'fear of being in places where you might feel trapped or helpless, like a crowded mall',
        'repeated episodes of intense anxiety and fear that reach a peak within minutes',
      ],
      correctOptionIndex: 0,
    ),
    Question(
      questionText: 'Which of the following are the risk factors of anxiety disorders?',
      options: [
        'All of the above',
        'Trauma',
        'Excessive stress',
        'Drugs or alcohol abuse',
      ],
      correctOptionIndex: 0,
    ),
    Question(
      questionText: 'Which of the following are the complications of anxiety disorders?',
      options: [
        'All of the above',
        'Depression, insomnia, poor quality of life',
        'Substance misuse, digestive problems',
        'Social isolation',
      ],
      correctOptionIndex: 0,
    ),
    Question(
      questionText: 'Which of the following is a recommended source of food for people with anxiety disorder?',
      options: [
        'Dark chocolate, leafy greens, omega-3 fatty acids, nuts, seeds',
        'Processed meat, ham',
        'Refined grains',
        'Trans fats',
      ],
      correctOptionIndex: 0,
    ),
    Question(
      questionText: 'What is the 3-3-3 rule for anxiety?',
      options: [
        'All of the above',
        'Look around you and name three things you see.',
        'name three sounds you hear',
        'move three parts of your body — your ankle, fingers, or arm',
      ],
      correctOptionIndex: 0,
    ),
    Question(
      questionText: 'Which of the following food sources are rich in magnesium?',
      options: [
        'Dark chocolate, avocado, nuts, seeds, tofu, whole grains',
        'Fast food, fried food',
        'White rice, white bread',
        'Soda, coffee, alcohol',
      ],
      correctOptionIndex: 0,
    ),
    Question(
      questionText: 'Which of the following is an example of possible medications for people with anxiety disorders?',
      options: [
        'All of the above',
        'Benzodiazepines (Xanax, Valium)',
        'Bupropion (Wellbutrin)',
        'Citalopram (Celexa - SSRI)',
      ],
      correctOptionIndex: 0,
    ),
  ];

  List<int> userAnswers = [];

  void addUserAnswer(int answerIndex) {
    userAnswers.add(answerIndex);
    if (userAnswers.length == questions.length) {
      navigatorKey.currentState!.pushNamed('/result', arguments: calculateScore());
    } else {
      navigatorKey.currentState!.pushNamed('/question/${userAnswers.length}');
    }
  }

  int calculateScore() {
    int score = 0;
    for (int i = 0; i < questions.length; i++) {
      if (userAnswers[i] == questions[i].correctOptionIndex) {
        score++;
      }
    }
    return score;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.deepPurple,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepPurple, // Set AppBar color to deep purple
          foregroundColor: Colors.white, // Set AppBar text color to white
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple[700],
            foregroundColor: Colors.white, // Set the text color to white
          ),
        ),
      ),
      navigatorKey: navigatorKey,
      initialRoute: '/',
      routes: {
        '/': (context) => const StartScreen(),
        '/question/0': (context) => QuestionScreen(questionIndex: 0, questions: questions, addUserAnswer: addUserAnswer),
        '/question/1': (context) => QuestionScreen(questionIndex: 1, questions: questions, addUserAnswer: addUserAnswer),
        '/question/2': (context) => QuestionScreen(questionIndex: 2, questions: questions, addUserAnswer: addUserAnswer),
        '/question/3': (context) => QuestionScreen(questionIndex: 3, questions: questions, addUserAnswer: addUserAnswer),
        '/question/4': (context) => QuestionScreen(questionIndex: 4, questions: questions, addUserAnswer: addUserAnswer),
        '/question/5': (context) => QuestionScreen(questionIndex: 5, questions: questions, addUserAnswer: addUserAnswer),
        '/question/6': (context) => QuestionScreen(questionIndex: 6, questions: questions, addUserAnswer: addUserAnswer),
        '/question/7': (context) => QuestionScreen(questionIndex: 7, questions: questions, addUserAnswer: addUserAnswer),
        '/question/8': (context) => QuestionScreen(questionIndex: 8, questions: questions, addUserAnswer: addUserAnswer),
        '/question/9': (context) => QuestionScreen(questionIndex: 9, questions: questions, addUserAnswer: addUserAnswer),
        '/question/10': (context) => QuestionScreen(questionIndex: 10, questions: questions, addUserAnswer: addUserAnswer),
        '/question/11': (context) => QuestionScreen(questionIndex: 11, questions: questions, addUserAnswer: addUserAnswer),
        '/result': (context) => const ResultScreen(),
      },
    );
  }
}
