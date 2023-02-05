import 'package:flutter/material.dart';

class MCQQuestion extends StatefulWidget {
  final String question;
  final List<String> answerChoices;
  final ValueChanged<String> onAnswerSelected;

  MCQQuestion({
    required this.question,
    required this.answerChoices,
    required this.onAnswerSelected,
  });

  @override
  _MCQQuestionState createState() => _MCQQuestionState();
}

// enum option { a, b, c, d }

class _MCQQuestionState extends State<MCQQuestion> {
  late var _selectedAnswer = "Red";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          margin: EdgeInsets.fromLTRB(0, 80, 0, 0),
        ),
        Text(widget.question),
        ...widget.answerChoices
            .map(
              (answer) => Card(
                margin: EdgeInsets.all(20),
                child: ListTile(
                  title: Text(answer),
                  leading: Radio(
                    value: answer,
                    groupValue: _selectedAnswer,
                    onChanged: (value) {
                      setState(() {
                        _selectedAnswer = value.toString();
                        widget.onAnswerSelected(value.toString());
                      });
                    },
                  ),
                ),
              ),
            )
            .toList(),
      ],
    );
  }
}
