import 'package:critique_corner/add_works.dart';
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

          actions: <Widget>[
            IconButton(
                color: Colors.redAccent,
                iconSize: 30,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const AddWorksPage()));
                },
                icon: const Icon(Icons.add)
            ),
          ],
        ),
        body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemCount: 3,
            itemBuilder: (context, index)
            {
              return Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                    color: Colors.black12,
                    height: 50,
                    width: 50,
                    child: ListTile(
                      onTap: (){},
                    )
                ),
              );
            },

        )
      // {
      //
      // },
    );
  }
}
