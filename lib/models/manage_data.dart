import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';
import 'package:nagp_quizup/models/user_data.dart';

class ManageDB {
  Future<void> insertUser(User user) async {
    final database = await openDatabase('user_database.db');
    final db = database;
    print('db variable $db');
    await db.insert(
      'users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    await db.close();
  }

  Future<List<User>> users() async {
    final database = await openDatabase('user_database.db');
    final db = database;
    final List<Map<String, dynamic>> maps = await db.query('users');
    await db.close();
    return List.generate(maps.length, (i) {
      return User(
          name: maps[i]['name'],
          age: maps[i]['age'],
          email: maps[i]['email'],
          password: maps[i]['password'],
          phoneNumber: maps[i]['phoneNumber'],
          profilePic: maps[i]['profilePic']);
    });
  }

  Future<bool> makeLogin(email, pw) async {
    var userList = await users();
    var found = false;
    if (userList.isNotEmpty) {
      print('printing all users $userList');
      userList.forEach((usr) {
        if (usr.email == email && usr.password == pw) {
          found = true;
        }
      });
    }
    return found;
  }

  Future<Object> getCurrentUser(email) async {
    var userList = await users();
    Object u1 = '';
    if (userList.isNotEmpty) {
      userList.forEach((usr) {
        if (usr.email == email) {
          u1 = usr;
        }
      });
    }
    return u1;
  }
}
