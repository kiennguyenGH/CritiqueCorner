import 'package:flutter/material.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPage();
}

class _TaskPage extends State<TaskPage> {


  final List<String> test = <String> ["one", "two", "three"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: const Text("Session"),
        titleTextStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        centerTitle: true,
        backgroundColor: Colors.black87,
        leadingWidth: 70,
        leading: TextButton(
          onPressed: () {},
          child: const Text(
            'Edit',
            style: TextStyle(fontSize:20, color: Colors.redAccent),
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
          itemCount: test.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              color: Colors.black12,
              height: 65,
              margin: const EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
              child: Row(
                  children: [
                    Text(
                      style: const TextStyle(color: Colors.white),
                      test[index]
                    )
                  ],
              )
            );
          }
      )
    );
  }
}
