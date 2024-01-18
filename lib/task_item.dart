import 'package:flutter/material.dart';

class Task {
  int id;
  String taskName;
  TimeOfDay time;
  bool isEnabled;
  Task(this.id, this.taskName, this.time, this.isEnabled);

  void toggleEnable()
  {
    isEnabled = !isEnabled;
  }

  @override
  String toString()
  {
    return taskName;
  }

}