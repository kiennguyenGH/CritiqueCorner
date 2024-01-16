import 'package:flutter/material.dart';

class WorkItem {
  String title;
  FileImage picture;
  List<String> comments;
  WorkItem(this.title, this.picture, this.comments);
}