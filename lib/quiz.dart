import 'package:flutter/material.dart';

import './answer.dart';
import './question.dart';
import 'questions_const.dart';
import 'result.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int totalScore = 0;
  int i = 0;

  void _answerQuestion(int score) {
    if (questions.length > i) {
      setState(() {
        totalScore += score;
        i++;
      });
    }
  }

  void reset() {
    setState(() {
      totalScore = 0;
      i = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 200),
      switchInCurve: Curves.easeInCirc,
      switchOutCurve: Curves.easeOutCirc,
      child: questions.length <= i
          ? Result(
              resultScore: totalScore,
              resetHandler: reset,
            )
          : Column(
              key: ValueKey(i),
              children: [
                SizedBox(height: 20),
                Question(
                  questions[i]['questionText'].toString(),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: questions[i]['answers'].length,
                    itemBuilder: (context, index) {
                      return Answer(
                        answer: questions[i]['answers'][index],
                        onChanged: (score) {
                          _answerQuestion(score);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
