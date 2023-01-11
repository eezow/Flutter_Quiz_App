import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  //const Result({Key key}) : super(key: key);
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var resultText;
    if (resultScore <= 10) {
      resultText = 'you are awesome ';
    } else if (resultScore <= 8) {
      resultText = ' pretty likeable';
    } else if (resultScore <= 16) {
      resultText = ' you are .. a bit strange';
    } else {
      resultText = 'you are awesome!';
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(
            onPressed: resetHandler,
            child: Text(
              'Restart the Quiz!',
            ),
            style: TextButton.styleFrom(primary: Colors.brown),
          )
        ],
      ),
    );
  }
}
