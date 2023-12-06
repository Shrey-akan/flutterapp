// question_paper_page.dart
import 'package:flutter/material.dart';
import 'package:jobmobapp/src/jobapplyform/jobapply_form.dart';
// import 'package:jobmobapp/src/postjobform/postjob.dart';


class QuestionPaperPage extends StatefulWidget {
  const QuestionPaperPage({Key? key}) : super(key: key);

  @override
  _QuestionPaperPageState createState() => _QuestionPaperPageState();
}

class _QuestionPaperPageState extends State<QuestionPaperPage> {
  // List of questions
  List<Question> questions = [
    Question(
      'What is the main function used for in Java?',
      ['Starting the program', 'Defining variables', 'Performing calculations', 'Handling exceptions'],
      'Starting the program',
    ),
    Question(
      'Which keyword is used to declare a constant in Java?',
      ['const', 'final', 'var', 'let'],
      'final',
    ),
    Question(
      'What is the output of the following Java code?\n\n'
      '```\nint x = 5;\nSystem.out.println(++x * 3 / x--);\n```',
      ['6', '5', '4', '8'],
      '6',
    ),
    Question(
      'Which loop is guaranteed to execute at least once in Java?',
      ['for loop', 'while loop', 'do-while loop', 'if statement'],
      'do-while loop',
    ),
    Question(
      'What is the purpose of the "super" keyword in Java?',
      ['Refers to the current instance of the class', 'Calls a method of the superclass', 'Declares a superclass', 'Indicates a variable is global'],
      'Calls a method of the superclass',
    ),
    Question(
      'In Java, how is an interface different from an abstract class?',
      ['Interfaces cannot have methods', 'Abstract classes cannot have constructors', 'Interfaces cannot have fields', 'Abstract classes cannot be implemented'],
      'Interfaces cannot have fields',
    ),
  ];

  // Map to store user answers
  Map<int, String?> userAnswers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Question Paper'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: questions.length,
          itemBuilder: (context, index) {
            return buildQuestionCard(index);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Calculate and show results
          showResults();
        },
        child: const Icon(Icons.check),
      ),
    );
  }

  Widget buildQuestionCard(int index) {
    Question question = questions[index];

    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Question ${index + 1}: ${question.text}',
              style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Column(
              children: question.options.map((option) {
                return RadioListTile<String?>(
                  title: Text(option),
                  value: option,
                  groupValue: userAnswers[index],
                  onChanged: (value) {
                    setState(() {
                      userAnswers[index] = value;
                    });
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  void showResults() {
    int totalScore = calculateScore();
    if (totalScore > 20) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const JobApplicationPage(jobTitle: '', companyName: '',)), // Replace ApplyFormPage with the actual page/widget you want to navigate to
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Quiz Results'),
            content: Text('Your total score is: $totalScore out of ${questions.length * 5} marks.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  int calculateScore() {
    int totalScore = 0;
    for (int i = 0; i < questions.length; i++) {
      Question question = questions[i];
      String? userAnswer = userAnswers[i];
      if (userAnswer != null && userAnswer.toLowerCase() == question.correctOption.toLowerCase()) {
        totalScore += 5;
      }
    }
    return totalScore;
  }
}

class Question {
  final String text;
  final List<String> options;
  final String correctOption;

  Question(this.text, this.options, this.correctOption);
}
