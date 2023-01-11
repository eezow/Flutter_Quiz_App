import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/result.dart';

import './quiz.dart';
import './answer.dart';
import './result.dart';
// void main() {
//   //run app is the material provided buy the flutter team,it does all the heavy
//   //lifting
//   runApp(MyFirstApp());
// }

void main() => runApp(MyFirstApp());

class MyFirstApp extends StatefulWidget {
  @override
  _MyFirstAppState createState() => _MyFirstAppState();
}

class _MyFirstAppState extends State<MyFirstApp> {
  static const _questions = [
    //addded a map to access values using their keys
    {
      'questionText': 'What\'s your favourite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 7},
        {'text': 'White', 'score': 1}
      ],
    },
    {
      'questionText': 'What\'s your favourite Animal?',
      'answers': [
        {'text': 'Bird', 'score': 10},
        {'text': 'Rhino', 'score': 8},
        {'text': 'Grasshopper', 'score': 7},
        {'text': 'Whale', 'score': 5}
      ],
    }

/* 
      'Whats\' your favorite color?',
      'Whats\' your favourite animal?',
      'Whats\' your favourite anima4?',
      'Whats\' your favourite anima5?', */
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _AnswerQuestion(int score) {
    _totalScore += score;

    if (_questionIndex < _questions.length) {
      print('we have more questions!');
    }

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
  }

  @override
  build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Thokoza Dlozi'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _AnswerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
