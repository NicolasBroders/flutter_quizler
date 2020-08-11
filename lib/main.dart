import 'package:flutter/material.dart';

void main() => runApp(Quizzler());

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
  List<Question> questionsList = [];
  Question currentQuestion;
  int questionIndex = 0;

  @override
  Widget build(BuildContext context) {
    questionsList.add(new Question(
        'You can lead a cow down stairs but not up stairs.', false));
    questionsList.add(new Question(
        'Approximately one quarter of human bones are in the feet.', true));
    questionsList.add(new Question('A slug\'s blood is green.', true));
    currentQuestion = questionsList[questionIndex];
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
      questionIndex = (questionIndex + 1) % questionsList.length;
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

class Question {
  String question;
  bool answer;

  Question(String question, bool answer) {
    this.question = question;
    this.answer = answer;
  }

  bool checkAnswer(bool answer) {
    return this.answer == answer;
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
