import 'package:flutter/material.dart';
import 'package:critique_corner/task_item.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {

  final _textController = TextEditingController();
  TimeOfDay _selectTime = TimeOfDay.now();

  bool _isTextFieldNotEmpty = false;
  Color buttonColor = Colors.white24;

  int generateID()
  {
    return DateTime.now().microsecondsSinceEpoch.remainder(100000);
  }

  void isEmpty()
  {
    setState(() {
      if (_textController.text.isEmpty)
      {
        _isTextFieldNotEmpty = false;
        buttonColor = Colors.white24;
      }
      else
      {
        _isTextFieldNotEmpty = true;
        buttonColor = Colors.redAccent;
      }
    });
  }

  void _showTimePicker() {
    showTimePicker(
        context: context,
        initialTime: _selectTime
    ).then((value) {
      setState(() {
        _selectTime = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white12,
        appBar: AppBar(
          leading: const BackButton(color: Colors.redAccent),
          title: const Text("Add Task"),
          titleTextStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          centerTitle: true,
          backgroundColor: Colors.black87,
          leadingWidth: 80,
        ),
      body: Column(
        children: [
          Container(
            color: Colors.white12,
            margin: const EdgeInsets.only(top:100),
            child: SizedBox(
              width:250,
              child: TextField(
                style: const TextStyle(color: Colors.white, fontSize: 17),
                controller: _textController,
                onChanged: (value) {
                    isEmpty();
                  },
                decoration: const InputDecoration(
                  labelText: "Task Label",
                  labelStyle: TextStyle(color: Colors.white24, fontSize: 20),
                  border: OutlineInputBorder()
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 25),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(7),
              child: Container(
                width: 250,
                color: Colors.white12,
                child: TextButton(
                  onPressed: () {
                    _showTimePicker();
                  },
                  child: Text(
                    _selectTime.format(context).toString(),
                    style: const TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 50),
            height: 50,
            width: 150,
            child: FloatingActionButton(
              onPressed: _isTextFieldNotEmpty ?
                () {Navigator.of(context).pop(Task(generateID(), _textController.text, _selectTime, true));}
                : null,
              backgroundColor: buttonColor,
              child: const Text(
                "Confirm",
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top:15),
            child: Center(
              child: TextButton(onPressed: () {
                Navigator.pop(context);},
                child: const Text("Cancel", style: TextStyle(fontSize: 17),)
              ),
            ),
          )
        ]
      )
    );
  }
}
