import 'package:nagp_quizup/screens/LandingPage.dart';
import 'package:flutter/material.dart';
import 'package:nagp_quizup/models/manage_data.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';

void main() async {
  ManageDB();
  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      join(await getDatabasesPath(), 'user_database.db'),
      onCreate: (db, version) {
    return db.execute(
      'CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age INTEGER, email TEXT, password TEXT, phoneNumber TEXT, profilePic TEXT)',
    );
  }, version: 1);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NAGP QuizUP',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const LandingPage(title: 'NAGP QuizUP'),
    );
  }
}
