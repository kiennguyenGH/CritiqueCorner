import 'package:critique_corner/add_session.dart';
import 'package:flutter/material.dart';
import 'package:critique_corner/task_item.dart';

class SessionPage extends StatefulWidget {
  const SessionPage({super.key});

  @override
  State<SessionPage> createState() => _SessionPageState();
}

class _SessionPageState extends State<SessionPage> {

  bool _isEditMode = false;
  String _editModeText = "Edit";

  void createNewTask(Task newTask)
  {
    setState(() {
      if (newTask != null)
      {
        sessionList.add(newTask);
      }
    });
  }

  void deleteTask(int index)
  {
    setState(() {
      sessionList.remove(sessionList[index]);
    });
  }

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

  static List<Task> sessionList = <Task> [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          title: const Text("Session"),
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
            Visibility(
              visible: !_isEditMode,
              child: IconButton(
                  color: Colors.redAccent,
                  iconSize: 30,
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => const AddSessionPage())
                    );
                    // createNewTask(newValue);

                  },
                  icon: const Icon(Icons.add)
              ),
            ),
          ],
        ),
        body: ListView.builder(
            itemCount: sessionList.length,
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
                                onPressed: () {
                                  showDialog(context: context, builder:(context)
                                  {
                                    return AlertDialog(
                                        backgroundColor: Colors.white12,
                                        content: SizedBox(
                                            height: 120,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                const Text("Delete session?", style: TextStyle(color: Colors.white, fontSize: 20),),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    SizedBox(
                                                      width: 100,
                                                      child: FloatingActionButton(
                                                        heroTag: "CancelButton",
                                                        child: const Text("Cancel"),
                                                        onPressed: (){
                                                          Navigator.pop(context);
                                                        },
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 100,
                                                      child: FloatingActionButton(
                                                        heroTag: "ConfirmButton",
                                                        child: const Text("Confirm"),
                                                        onPressed: (){
                                                          Navigator.pop(context);
                                                          deleteTask(index);
                                                        },

                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            )
                                        )
                                    );
                                  });
                                },
                                icon: const Icon(Icons.delete),
                                color: Colors.redAccent,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(style: const TextStyle(color: Colors.white, fontSize: 20), sessionList[index].taskName),
                                Text(style: const TextStyle(color: Colors.white, fontSize: 17), sessionList[index].time.format(context).toString()),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Visibility(
                              visible: !_isEditMode,
                              child: Switch(value: sessionList[index].isEnabled, onChanged: (value) {
                                {
                                  setState(() {
                                    sessionList[index].toggleEnable();
                                  });
                                }
                              }))
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
