import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);
  String get resultPhrase {
    var resultText = 'Congratulation you final sccore is';
    if (resultScore <= 8) {
      resultText = 'You done preety good';
    } else if (resultScore <= 12) {
      resultText = 'Preety likable';
    } else if (resultScore <= 16) {
      resultText = 'You are a strange';
    } else {
      resultText = 'You haven\'t done well try again';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            onPressed: resetHandler,
            child: Text('Restart Quiz!'),
            textColor: Colors.blue,
          )
        ],
      ),
    );
  }
}
