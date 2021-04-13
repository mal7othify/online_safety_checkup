import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

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

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            '$resultScore %',
            style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.blue)),
            child: Text(
              'Restart Quiz!',
            ),
            onPressed: resetHandler(),
          ),
        ],
      ),
    );
  }
}
