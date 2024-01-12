import 'package:critique_corner/session.dart';
import 'package:critique_corner/tasks.dart';
import 'package:critique_corner/works.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _index = 0;

  void _navigate(int index)
  {
    setState(() {
      _index = index;
    });
  }

  final List<Widget> _pages = [
    TaskPage(),
    WorksPage(),
    SessionPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        selectedFontSize: 17,
        unselectedFontSize: 17,
        currentIndex: _index,
        onTap: _navigate,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.task_alt), label: "Tasks"),
          BottomNavigationBarItem(icon: Icon(Icons.image), label: "Works"),
          BottomNavigationBarItem(icon: Icon(Icons.timer), label: "Session"),
        ]
      )
    );
  }
}
