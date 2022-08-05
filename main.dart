import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/result.dart';
import './result.dart';
import './quiz.dart';

//void main() {
//runApp(FirstApp());
//}
void main() => runApp(FirstApp());

// use ctrl+shift+R to direct change StatelessWidget to StatefullWidget
class FirstApp extends StatefulWidget {
  //type create state to get below function
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FirstAppState();
  }
}

// you can use '_' underscore to make our class from public to private
//Private means it can only use main.dart file not any other sources
class _FirstAppState extends State<FirstApp> {
  //static const questions = [
  final _questions = const [
    {
      'questionText': 'What\'s your favourite food?',
      'answer': [
        {'text': 'Pizza', 'score': 10},
        {'text': 'Chai', 'score': 1},
        {'text': 'Popcorn', 'score': 7},
        {'text': 'Samurai', 'score': 5}
      ],
    },
    {
      'questionText': 'What\'s your sibling name?',
      'answer': [
        {'text': 'Rohan', 'score': 10},
        {'text': 'Rahul', 'score': 1},
        {'text': 'Divya', 'score': 7},
        {'text': 'Gangu Bai', 'score': 5}
      ],
    },
    {
      'questionText': 'Where is your house located?',
      'answer': [
        {'text': 'England', 'score': 6},
        {'text': 'Japan', 'score': 5},
        {'text': 'China', 'score': 1},
        {'text': 'Srilanka', 'score': 8}
      ],
    },
    {
      'questionText': 'What\'s your mother toungue?',
      'answer': [
        {'text': 'Hindi', 'score': 5},
        {'text': 'English', 'score': 6},
        {'text': 'Marwari', 'score': 8},
        {'text': 'haryanvi', 'score': 10}
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;
  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    // var aBool = true;
    // aBool = false;
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have no more questions');
    } else {
      print('No More Questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    // var dummy = const ['Void'];
    //dummy.add('George');
    // print(dummy);
    //dummy = [];
    // questions = []; this dosen't work if question is const
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Lokesh Third App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
