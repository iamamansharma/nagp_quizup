import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      join(await getDatabasesPath(), 'user_database.db'),
      onCreate: (db, version) {
    return db.execute(
      'CREATE TABLE users(id INTEGER PRIMARY KEY, name TEXT, age INTEGER, email TEXT, password TEXT, phoneNumber TEXT, profilePic TEXT)',
    );
  }, version: 1);

  Future<void> insertUser(User user) async {
    final db = await database;
    await db.insert(
      'users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<User>> users() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('users');

    return List.generate(maps.length, (i) {
      return User(
          id: maps[i]['id'],
          name: maps[i]['name'],
          age: maps[i]['age'],
          email: maps[i]['email'],
          password: maps[i]['password'],
          phoneNumber: maps[i]['phoneNumber'],
          profilePic: maps[i]['profilePic']);
    });
  }

  var u1 = const User(
      id: 0,
      name: 'u1',
      age: 22,
      email: 'abcd@gmiol.com',
      password: '1qaz',
      phoneNumber: '1234123455',
      profilePic: 'profilepic.jpg');
  await insertUser(u1);
  print(await users());
}

class User {
  final int id;
  final String name;
  final int age;
  final String email;
  final String password;
  final String phoneNumber;
  final String profilePic;

  const User({
    required this.id,
    required this.name,
    required this.age,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.profilePic,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'profilePic': profilePic
    };
  }

  @override
  String toString() {
    return 'User{id: $id, name: $name, age: $age, email: $email, password: $password, phoneNumber: $phoneNumber, profilePic: $profilePic';
  }
}
