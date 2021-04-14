import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Map answer;
  final ValueChanged<int> onChanged;

  Answer({required this.answer, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      
      child: Material(
        color: Theme.of(context).primaryColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () {
            onChanged(answer['score']);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(answer['text']),
          ),
        ),
      ),
    );
  }
}
