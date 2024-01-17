import 'package:flutter/material.dart';

class WorkItem {
  String title;
  FileImage picture;
  List<String> comments;

  void addComment(String comment)
  {
    comments.add(comment);
  }

  void removeComment(String comment)
  {
    comments.remove(comment);
  }

  WorkItem(this.title, this.picture, this.comments);
}