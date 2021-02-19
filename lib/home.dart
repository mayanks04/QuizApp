import 'package:QuizApp/model/question.dart';
import 'package:flutter/material.dart';

class QuizApp extends StatefulWidget {
  QuizApp({Key key}) : super(key: key);

  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int _currentQuestionIndex = 0;
  List questionBank = [
    Question.askMe("India celebrate Independance day on 15th of August", true),
    Question.askMe("National animal of India is  a Cow", false),
    Question.askMe("India's First captial is Kolkata", true),
    Question.askMe("Does India has 28 state", false),
    Question.askMe("National animal of India is a Tiger", true),
    Question.askMe("New Delhi is a captial of India", true)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("True Citizen"),
        centerTitle: true,
        backgroundColor: Colors.orange.shade800,
      ),
      backgroundColor: Colors.orange.shade800,
      // We use [Builder] here use a [context] that is desendent of[Scaffold]
      //Or else [Scaffold] will return Null

      body: Builder(
        builder: (BuildContext context) => Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Image.asset(
                  "images/ind.jfif",
                  width: 300.0,
                  height: 200.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                          color: Colors.green.shade300,
                          style: BorderStyle.solid)),
                  height: 120.0,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        questionBank[_currentQuestionIndex].questionText,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            color: Colors.blue.shade900),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () => _checkAswer(true, context),
                    color: Colors.blueGrey.shade900,
                    child: Text(
                      "TRUE",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => _checkAswer(false, context),
                    color: Colors.blueGrey.shade900,
                    child: Text(
                      "FALSE",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => _nextQuestion(),
                    color: Colors.blueGrey.shade900,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _checkAswer(bool userChoice, BuildContext context) {
    if (userChoice == questionBank[_currentQuestionIndex].isCorrect) {
      setState(() {
        _currentQuestionIndex =
            (_currentQuestionIndex + 1) % questionBank.length;
      });
      final snackBar = SnackBar(
        backgroundColor: Colors.green,
        duration: Duration(milliseconds: 500),
        content: Text("Correct!"),
      );
      Scaffold.of(context).showSnackBar(snackBar);
      // Correct answer
      debugPrint("Yes Correct");
    } else {
      final snackBar = SnackBar(
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.red,
        content: Text("Incorrect!"),
      );
      Scaffold.of(context).showSnackBar(snackBar);
      debugPrint("Incorrect");
    }
  }

  _nextQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBank.length;
    });
  }
}
