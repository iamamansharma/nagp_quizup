import 'package:flutter/material.dart';
import 'package:nagp_quizup/widget/question.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key, required this.quiz});

  final String quiz;

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return MCQQuestion(
      question: 'What is your favorite color?',
      answerChoices: ['Red', 'Green', 'Blue', 'Yellow'],
      onAnswerSelected: (answer) {
        print('Selected answer: $answer');
      },
    );
  }
}
  //   return Column(
  //     children: <Widget>[
  //       Card(
  //         margin: EdgeInsets.all(50),
  //       ),
  //       Text(widget.quiz),
  //       Card(
  //         margin: EdgeInsets.all(20), 
  //         child: ListTile(
  //           title: const Text('A'),
  //           leading: Radio<option>(
  //             value: option.a,
  //             groupValue: _selected,
  //             onChanged: (option? value) {
  //               setState(() {
  //                 _selected = value;
  //               });
  //             },
  //           ),
  //         ),
  //       ),
  //       Card(
  //         margin: EdgeInsets.all(20),
  //         child: ListTile(
  //           title: const Text('B'),
  //           leading: Radio<option>(
  //             value: option.b,
  //             groupValue: _selected,
  //             onChanged: (option? value) {
  //               setState(() {
  //                 _selected = value;
  //               });
  //             },
  //           ),
  //         ),
  //       ),
  //       Card(
  //         margin: EdgeInsets.all(20),
  //         child: ListTile(
  //           title: const Text('C'),
  //           leading: Radio<option>(
  //             value: option.c,
  //             groupValue: _selected,
  //             onChanged: (option? value) {
  //               setState(() {
  //                 _selected = value;
  //               });
  //             },
  //           ),
  //         ),
  //       ),
  //       Card(
  //         margin: EdgeInsets.all(20),
  //         child: ListTile(
  //           title: const Text('D'),
  //           leading: Radio<option>(
  //             value: option.d,
  //             groupValue: _selected,
  //             onChanged: (option? value) {
  //               setState(() {
  //                 _selected = value;
  //               });
  //             },
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }
