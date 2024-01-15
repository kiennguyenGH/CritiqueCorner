import 'package:critique_corner/add_session.dart';
import 'package:critique_corner/session_list.dart';
import 'package:critique_corner/session_player.dart';
import 'package:flutter/material.dart';

class SessionPage extends StatefulWidget {
  const SessionPage({super.key});

  @override
  State<SessionPage> createState() => _SessionPageState();
}

class _SessionPageState extends State<SessionPage> {

  bool _isEditMode = false;
  String _editModeText = "Edit";

  void createNewList(SessionList newList)
  {
    setState(() {
        sessionList.add(newList);
    });
  }

  void deleteList(int index)
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

  static List<SessionList> sessionList = <SessionList> [];

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
                  onPressed: () async {
                    var newValue = await Navigator.push(
                        context, MaterialPageRoute(builder: (context) => const AddSessionPage())
                    );
                    createNewList(newValue);

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
                padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.black12,
                  child: ListTile(
                      onTap: !_isEditMode ? (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SessionPlayerPage(sessionList[index]))
                        );
                      } : null,
                      trailing: Visibility(
                        visible: !_isEditMode,
                        child: const Icon(Icons.arrow_right, size: 50, color: Colors.white10)),
                      leading: Visibility(
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
                                                deleteList(index);
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
                      title: Container(
                        height: 75,
                        alignment: Alignment.centerLeft,
                        child: Text(style: const TextStyle(color: Colors.white, fontSize: 20), sessionList[index].listLabel)
                      )
                  ),
                ),
              );
            }
        )
    );
  }
}
