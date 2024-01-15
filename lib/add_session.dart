import 'package:critique_corner/add_session_item.dart';
import 'package:critique_corner/session_list.dart';
import 'package:flutter/material.dart';
import 'package:critique_corner/session_item.dart';

class AddSessionPage extends StatefulWidget {
  const AddSessionPage({super.key});

  @override
  State<AddSessionPage> createState() => _AddSessionPageState();
}

class _AddSessionPageState extends State<AddSessionPage> {

  List<SessionItem> itemList = <SessionItem> [];
  final _textController = TextEditingController();
  bool _isTextFieldNotEmpty = false;
  Color buttonColor = Colors.white24;

  void isEmpty()
  {
    setState(() {
      if (_textController.text.isNotEmpty && itemList.isNotEmpty)
      {
        _isTextFieldNotEmpty = true;
        buttonColor = Colors.redAccent;
      }
      else
      {
        _isTextFieldNotEmpty = false;
        buttonColor = Colors.white24;
      }
    });
  }

  void addItem(SessionItem item)
  {
    setState(() {
      itemList.add(item);
    });
  }

  void deleteItem(SessionItem item)
  {
    setState(() {
      itemList.remove(item);
    });
  }

  String twoDigits(int num)
  {
    return num.toString().padLeft(2, '0');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white12,
        appBar: AppBar(
          leading: const BackButton(color: Colors.redAccent),
          title: const Text("Add Session"),
          titleTextStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          centerTitle: true,
          backgroundColor: Colors.black87,
          leadingWidth: 80,
        ),
        body: Column(
            children: [
              Container(
                color: Colors.white12,
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                child: SizedBox(
                  width:250,
                  child: TextField(
                    style: const TextStyle(color: Colors.white, fontSize: 17),
                    controller: _textController,
                    onChanged: (value) {
                      isEmpty();
                    },
                    decoration: const InputDecoration(
                        labelText: "Session Label",
                        labelStyle: TextStyle(color: Colors.white24, fontSize: 20),
                        border: OutlineInputBorder()
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 55,
                child: Container(
                  color: Colors.black12,
                  child: ListView.builder(
                    itemCount: itemList.length + 1,
                    itemBuilder: (context, index) {
                      if (index == itemList.length)
                      {
                        return Center(
                          heightFactor: 2,
                          child: SizedBox(
                            height: 30,
                            child: FloatingActionButton(
                                heroTag: "AddSessionButton",
                                shape: const CircleBorder(),
                                backgroundColor: Colors.green,
                                onPressed: () async {
                                  final newValue = await Navigator.push(context, MaterialPageRoute(builder: (context) => const AddSessionItemPage()));
                                  addItem(newValue);
                                  isEmpty();
                                },
                                child: const Icon(Icons.add, color: Colors.white)),
                          ),
                        );
                      }
                      else
                      {
                        return Container(
                            color: Colors.white10,
                            height: 100,
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: (){
                                    deleteItem(itemList[index]);
                                    isEmpty();
                                  },
                                  icon: const Icon(Icons.delete),
                                  color: Colors.redAccent,
                                  iconSize: 30
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left:10),
                                  width: 200,
                                  child: Text(
                                    itemList[index].sessionLabel,
                                    style: const TextStyle(color: Colors.white, fontSize: 20),
                                  ),
                                ),
                                Text('${twoDigits(itemList[index].timeLength.inHours)}:${twoDigits(itemList[index].timeLength.inMinutes.remainder(60))}:${twoDigits(itemList[index].timeLength.inSeconds.remainder(60))}',
                                    style: const TextStyle(color: Colors.white, fontSize: 20)
                                )
                              ],
                            )
                        );
                      }
                    },
                  ),
                ),
              ),
              Expanded(
                flex:12,
                child: Container(
                  margin: const EdgeInsets.only(top: 50),
                  height: 50,
                  width: 150,
                  child: FloatingActionButton(
                    heroTag: "ConfirmSessionButton",
                    onPressed: (_isTextFieldNotEmpty) ? () {
                      Navigator.of(context).pop(SessionList(_textController.text, itemList));
                      } : null,
                    backgroundColor: buttonColor,
                    child: const Text(
                      "Confirm",
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 12,
                child: Container(
                  margin: const EdgeInsets.only(top:15),
                  child: Center(
                    child: TextButton(onPressed: () {
                      Navigator.pop(context);},
                        child: const Text("Cancel", style: TextStyle(fontSize: 17),)
                    ),
                  ),
                ),
              )
            ]
        )
    );
  }
}
