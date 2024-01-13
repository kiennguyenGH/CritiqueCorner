import 'package:flutter/material.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPage();
}

class _TaskPage extends State<TaskPage> {

  bool _isEditMode = false;
  String _editModeText = "Edit";


  final List<String> taskList = <String> ["one", "two", "three"];

  void _editModeToggle() {
    setState(() {
      _isEditMode = !_isEditMode;
      if (_isEditMode)
      {
        _editModeText = "Done";
      }
      else
      {
        _editModeText = "Edit";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: const Text("Tasks"),
        titleTextStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        centerTitle: true,
        backgroundColor: Colors.black87,
        leadingWidth: 80,
        leading: TextButton(
          onPressed: _editModeToggle,
          child: Text(
            _editModeText,
            style: const TextStyle(fontSize:20, color: Colors.redAccent),
          ),
        ),
        actions: <Widget>[
            IconButton(
              color: Colors.redAccent,
              iconSize: 30,
              onPressed: () {},
              icon: const Icon(Icons.add)
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: taskList.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 7),
              child: Container(
                color: Colors.black12,
                height: 115,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 5),
                        child: Visibility(
                          visible: _isEditMode,
                          child: IconButton(
                            iconSize: 35,
                            onPressed: () {},
                            icon: const Icon(Icons.delete),
                            color: Colors.redAccent,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(style: TextStyle(color: Colors.white, fontSize: 20), "Task Name"),
                            Text(style: TextStyle(color: Colors.white, fontSize: 17), "Time"),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Switch(value: true, onChanged: (bool value) {})
                    ],
                  ),
                )
              ),
            );
          }
      )
    );
  }
}
