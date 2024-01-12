import 'package:flutter/material.dart';

class TasksProfilePage extends StatefulWidget {
  const TasksProfilePage({super.key});

  @override
  State<TasksProfilePage> createState() => _TasksProfilePageState();
}

class _TasksProfilePageState extends State<TasksProfilePage> {
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
          Expanded(
            flex:15,
            child: Row(
              children: [
                const Expanded(
                  child: IconButton(
                      iconSize: 45,
                      onPressed: null,
                      icon: Icon(Icons.task_alt)
                  ),
                ),
                Expanded(
                  child: IconButton(
                      iconSize: 45,
                      onPressed: () {},
                      icon: const Icon(Icons.image)
                  ),
                ),
                Expanded(
                  child: IconButton(
                      iconSize: 45,
                      onPressed: () {},
                      icon: const Icon(Icons.timer)
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
