import 'package:awesome_notifications/awesome_notifications.dart';
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
    const TaskPage(),
    const WorksPage(),
    const SessionPage()
  ];

  @override
  Widget build(BuildContext context) {

    @override
    void initState() {
      super.initState();
      AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
        if (!isAllowed) {
          AwesomeNotifications().requestPermissionToSendNotifications();
        }
      });
    }

    return Scaffold(
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.white38,
        selectedItemColor: Colors.redAccent,
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
