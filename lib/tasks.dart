import 'package:critique_corner/session.dart';
import 'package:critique_corner/works.dart';
import 'package:flutter/material.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPage();
}

class _TaskPage extends State<TaskPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex:15,
            child: Row(
              children: [
                Expanded(
                  flex:20,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                        'Edit',
                        style: TextStyle(fontSize:20),
                    ),
                  ),
                ),
                const Expanded(
                  flex:60,
                  child:
                    Text(
                      "Tasks",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize:20),
                    )
                ),
                Expanded(
                  flex:20,
                  child: IconButton(
                    iconSize: 30,
                    onPressed: () {},
                    icon: const Icon(Icons.add)
                  ),
                ),
              ],
            ),
          ),
          const Expanded(
            flex:60,
            child: Column(
              children: [
                Text("List of tasks")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
