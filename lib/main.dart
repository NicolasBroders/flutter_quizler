import 'package:flutter/material.dart';
import 'package:flutter_quizler/quiz_brain.dart';

import 'Question.dart';

void main() => runApp(Quizzler());

QuizBrain quizBrain = new QuizBrain();

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> resList = [];
  Question currentQuestion;
  int questionIndex = 0;

  @override
  Widget build(BuildContext context) {
    currentQuestion = quizBrain.questionList[questionIndex];
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                currentQuestion.question,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                updateUiWithAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                updateUiWithAnswer(false);
              },
            ),
          ),
        ),
        Row(
          children: resList,
        ), //TODO: Add a Row here as your score keeper
      ],
    );
  }

  void updateUiWithAnswer(bool userAnswer) {
    setState(() {
      addResToList(currentQuestion.checkAnswer(userAnswer));
      questionIndex = (questionIndex + 1) % quizBrain.questionList.length;
    });
  }

  void addResToList(bool correct) {
    if (correct) {
      resList.add(
        Icon(
          Icons.check,
          color: Colors.green,
        ),
      );
    } else {
      resList.add(
        Icon(
          Icons.close,
          color: Colors.red,
        ),
      );
    }
  }
}
