import 'package:critique_corner/add_works.dart';
import 'package:critique_corner/work_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class WorksPage extends StatefulWidget {
  const WorksPage({super.key});

  @override
  State<WorksPage> createState() => _WorksPageState();
}

class _WorksPageState extends State<WorksPage> {
  
  static List<WorkItem> worksList = <WorkItem> [];

  void addWork(WorkItem item)
  {
    setState(() {
      worksList.add(item);
    });
  }

  void deleteWork(WorkItem item)
  {
    setState(() {
      worksList.remove(item);
    });
  }
  
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
                onPressed: () async {
                  final newValue = await Navigator.push(context, MaterialPageRoute(builder: (context) => const AddWorksPage()));
                  if (newValue != null)
                  {
                    addWork(newValue);
                  }
                },
                icon: const Icon(Icons.add)
            ),
          ],
        ),
        body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemCount: worksList.length,
            itemBuilder: (context, index)
            {
              return Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: worksList[index].picture,
                          fit: BoxFit.cover
                      ),
                    ),
                    child: ListTile(
                      onTap: (){},
                      onLongPress: (){
                        showCupertinoModalPopup(context: context,
                            builder: (BuildContext context) => CupertinoActionSheet(
                              actions: <CupertinoActionSheetAction>[
                                CupertinoActionSheetAction(
                                    onPressed: (){
                                      deleteWork(worksList[index]);
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Delete Work", style: TextStyle(color: Colors.redAccent, fontSize: 25))
                                ),
                              ],

                            )
                        );
                      },
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
