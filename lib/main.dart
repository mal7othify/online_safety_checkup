import 'package:flutter/material.dart';
import 'package:online_safety_checkup/quiz.dart';
import 'package:online_safety_checkup/result.dart';

import 'questions_const.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Online Safety Checkup'),
        ),
        body: Quiz(),
      ),
    );
  }
}
