import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
part 'database.g.dart';

class ToDoDatabase {
  List toDoList = [];
  final _myBox = Hive.box('myBox');

// chay cai nay neu day la lan dau tien mo app
  void createInintData() {
    toDoList = [
      ["Buy Foods", true],
      ["Check Emails", false],
      ["Do Flutter Exercise", false],
      ["Code Flutters", true],
      ["Work on JS", true],
      ["Learning English", false],
    ];
  }

// load data from database
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

// update database
  void updateData() {
    _myBox.put("TODOLIST", toDoList);
  }
}

/// login
@HiveType(typeId: 1)
class User {
  User({
    required this.username,
    required this.password,
  });

  @HiveField(0)
  final String username;

  @HiveField(1)
  final String password;
}