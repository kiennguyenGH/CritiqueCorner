import 'package:flutter/material.dart';

class Task {
  String taskName;
  TimeOfDay time;
  bool isEnabled;
  Task(this.taskName, this.time, this.isEnabled);
}