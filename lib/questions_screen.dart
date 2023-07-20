import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
//import 'dart:math';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});
  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;
  void answerQuestion() {
    //currentQuestionIndex = currentQuestionIndex + 1;
    //currentQuestionIndex += 1;
    setState(() {
      currentQuestionIndex++;
      //currentQuestionIndex = Random().nextInt(100) + 1;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(currentQuestion.text,
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map((item) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: AnswerButton(
                  answerText: item,
                  onTap: answerQuestion,
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
