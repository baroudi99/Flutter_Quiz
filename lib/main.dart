import 'package:flutter/material.dart';

import 'app.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

App apps = App();

void main() {
  runApp(Quiz());
}

class Quiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('Quiz app'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: QuizApp(),
        ),
      ),
    );
  }
}

class QuizApp extends StatefulWidget {
  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  List<Widget> answerResult = [];
  int right = 0;
  void checkAnswer(bool whatUserPicked) {
    bool correctAnswer = apps.getQuestionAnser();
    setState(() {
      if (whatUserPicked == correctAnswer) {
        right++;
        answerResult.add(
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Icon(
              Icons.thumb_up,
              color: Colors.green,
            ),
          ),
        );
      } else {
        answerResult.add(
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Icon(
              Icons.thumb_down,
              color: Colors.red,
            ),
          ),
        );
      }
      if (apps.end() == true) {
        Alert(
          context: context,
          title: "Notre Quiz est terminer !!",
          desc: "Vous avez repondez a $right reponses de 7 reponse total",
          buttons: [
            DialogButton(
              child: Text(
                "Commencer a nouveau ",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 200,
            )
          ],
        ).show();
        apps.reset();
        answerResult = [];
        right = 0;
      } else {
        apps.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: answerResult,
        ),
        Expanded(
          flex: 5,
          child: Column(
            children: [
              Image.asset(apps.getQuestionImage()),
              SizedBox(
                height: 20.0,
              ),
              Text(
                apps.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: TextButton(
                style: TextButton.styleFrom(
                    primary: Colors.white, backgroundColor: Colors.green),
                onPressed: () {
                  checkAnswer(true);
                },
                child: Text(
                  'vrai',
                  style: TextStyle(fontSize: 22.0),
                )),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: TextButton(
                style: TextButton.styleFrom(
                    primary: Colors.white, backgroundColor: Colors.red),
                onPressed: () {
                  checkAnswer(false);
                },
                child: Text(
                  'faux',
                  style: TextStyle(fontSize: 22.0),
                )),
          ),
        ),
      ],
    );
  }
}
