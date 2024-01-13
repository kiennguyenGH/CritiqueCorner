import 'package:flutter/material.dart';

class WorksPage extends StatefulWidget {
  const WorksPage({super.key});

  @override
  State<WorksPage> createState() => _WorksPageState();
}

class _WorksPageState extends State<WorksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          title: const Text("Works"),
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
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  color: Colors.black12,
                  height: 65,
                  margin: EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
                  child: Row(
                    children: [
                      Text(
                          style: TextStyle(color: Colors.white),
                          'test'
                      )
                    ],
                  )
              );
            }
        )
      // {
      //
      // },
    );
  }
}
