import 'package:flutter/material.dart';
import 'package:online_safety_checkup/quiz.dart';
import 'package:online_safety_checkup/result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Do you have a password manager?',
      'answers': [
        {'text': 'Yes.', 'score': 10},
        {'text': 'No.', 'score': 0}
      ],
    },
    {
      'questionText': 'Tell me about the characteristics of your passwords:',
      'answers': [
        {'text': 'My password contains small and capital letters.', 'score': 0},
        {'text': 'My password is more than eight digits.', 'score': 0},
        {'text': 'My password contains special characters.', 'score': 0},
        {'text': 'My password contains numbers.', 'score': 0},
        {'text': 'My passwords meet all of the above criteria.', 'score': 10},
      ],
    },
    {
      'questionText': 'Do you use a virtual private network (VPN)?',
      'answers': [
        {'text': 'Yes.', 'score': 10},
        {'text': 'No.', 'score': 0}
      ],
    },
    {
      'questionText':
          'Did you activate the two-factor authenticator/ multifactor authenticator?',
      'answers': [
        {'text': 'Yes.', 'score': 10},
        {'text': 'No.', 'score': 0}
      ],
    },
    {
      'questionText': 'What do you think about the firewall software?',
      'answers': [
        {
          'text': 'A firewall is a great way to protect my device.',
          'score': 10
        },
        {'text': 'I don’t like to use a firewall for my device.', 'score': 0}
      ],
    },
    {
      'questionText': 'Do you know what incognito mode and do you use it?',
      'answers': [
        {'text': 'Yes.', 'score': 10},
        {'text': 'No.', 'score': 0}
      ],
    },
    {
      'questionText':
          'If you saw an application you want, where do you prefer to get it?',
      'answers': [
        {
          'text': 'From any website that provides a download option for it.',
          'score': 0
        },
        {
          'text':
              'From its official website or from the device\'s operating system store.',
          'score': 10
        }
      ],
    },
    {
      'questionText':
          'A stranger has asked you to plug their device into your device, what do you do?',
      'answers': [
        {'text': 'I accept immediately because I’m nice!', 'score': 0},
        {'text': 'I apologize and decline.', 'score': 10}
      ],
    },
    {
      'questionText':
          'Someone you don’t know with a friendly name sent you a message with a link to check it out. Your response:',
      'answers': [
        {
          'text': 'I open the link and send them back my opinion about it.',
          'score': 0
        },
        {'text': 'Ignore the message and do nothing at all.', 'score': 10}
      ],
    },
    {
      'questionText': 'Where do you back your data regularly?',
      'answers': [
        {'text': 'I don’t.', 'score': 0},
        {'text': 'I use the cloud or a hard drive.', 'score': 10}
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
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Online Safety Checkup'),
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
