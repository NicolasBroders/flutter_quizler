class Question {
  String _question;
  bool _answer;

  Question(String question, bool answer) {
    _question = question;
    _answer = answer;
  }

  bool checkAnswer(bool answer) {
    return _answer == answer;
  }

  String getQuestionText() {
    return _question;
  }
}
