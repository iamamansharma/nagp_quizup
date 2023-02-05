import 'package:flutter/material.dart';
import 'package:nagp_quizup/screens/loginPage.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage(
      {super.key, required this.title, required this.emailAddress});

  final String title;
  final String emailAddress;
  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text(widget.emailAddress),
      ),
    );
  }
}
