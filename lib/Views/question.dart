import 'package:flutter/material.dart';
import 'package:quiz_app/Views/answer.dart';
import '../Models/shared_data.dart';
import '../data/questions.dart';
import 'last_screen.dart';

class Question extends StatefulWidget {
  const Question({super.key});

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  int currentQuestionIndex = 0;
  String? selectedAnswer;
  bool? isCorrect;
  final List<String> correctAnswers = [
    "Sahara",
    "Silver",
    "None of the above",
  ];

  void nextQuestion() {
    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        if (selectedAnswer == correctAnswers[currentQuestionIndex]) {
          SharedData.instance.score += 1;
        }
        currentQuestionIndex++;
        selectedAnswer = null;
        isCorrect = null;
      } else {
        if (selectedAnswer == correctAnswers[currentQuestionIndex]) {
          SharedData.instance.score += 1;
        }
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const LastPage(),
          ),
        );
      }
    });
  }

  void selectAnswer(String answer) {
    setState(() {
      selectedAnswer = answer;
      isCorrect = answer == correctAnswers[currentQuestionIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF86948F),
        title: const Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: Text(
            "QUIZ",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "Assets/Image/Ellipse 1.png",
                height: 200,
                width: 200,
              ),
              Center(
                child: Container(
                  constraints: const BoxConstraints(
                    maxWidth: 300,
                    minWidth: 100,
                  ),
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      color: const Color(0xFFB8E893),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              const Spacer(),
                              Text(
                                  "${currentQuestionIndex + 1}/${questions.length}"),
                            ],
                          ),
                          Text(
                            currentQuestion.text,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.9),
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                          const SizedBox(height: 30),
                          ...currentQuestion.answers.map((answer) {
                            final bool isAnswerCorrect =
                                answer == correctAnswers[currentQuestionIndex];
                            Color answerColor;

                            if (selectedAnswer == null) {
                              answerColor = Colors.white;
                            } else if (answer == selectedAnswer) {
                              answerColor =
                                  isCorrect == true ? Colors.green : Colors.red;
                            } else if (isAnswerCorrect) {
                              answerColor = Colors.green;
                            } else {
                              answerColor = Colors.white;
                            }

                            return Answer(
                              answerText: answer,
                              isSelected: answer == selectedAnswer,
                              answerColor: answerColor,
                              onPressed: () {
                                if (selectedAnswer == null) {
                                  selectAnswer(answer);
                                }
                              },
                            );
                          }),
                          const SizedBox(height: 30),
                          ElevatedButton(
                            onPressed:
                                selectedAnswer != null ? nextQuestion : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF86948F),
                            ),
                            child: const Text(
                              "Next",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
