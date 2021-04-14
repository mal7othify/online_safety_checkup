import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function() resetHandler;

  const Result({required this.resultScore, required this.resetHandler});

  String get resultPhrase {
    String resultText;
    if (100 >= resultScore && resultScore >= 90) {
      resultText = 'You are secure!';
    } else if (89 >= resultScore && resultScore >= 80) {
      resultText = 'You are doing fine';
    } else if (79 >= resultScore && resultScore >= 70) {
      resultText = 'Your security measures are not too bad';
    } else if (69 >= resultScore && resultScore >= 60) {
      resultText = 'Your security measures are ok';
    } else
      resultText = 'You need to increase your security measures';
    return resultText;
  }

  Color get resultColor {
    if (100 >= resultScore && resultScore >= 90) {
      return Colors.greenAccent;
    } else if (89 >= resultScore && resultScore >= 80) {
      return Colors.orangeAccent;
    } else if (79 >= resultScore && resultScore >= 70) {
     return Colors.orangeAccent;
    } else if (69 >= resultScore && resultScore >= 60) {
     return Colors.orangeAccent;
    } else
    {return Colors.red;}
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '$resultScore %',
            style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold, color: resultColor),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 50),
          TextButton(
            style: ButtonStyle(foregroundColor: MaterialStateProperty.all(Colors.blue)),
            child: Text(
              'Restart Quiz!',
            ),
            onPressed:() => resetHandler(),
          ),
        ],
      ),
    );
  }
}
