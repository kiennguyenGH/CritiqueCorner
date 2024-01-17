import 'package:flutter/material.dart';
import 'work_item.dart';

class WorksViewerPage extends StatefulWidget {

  final WorkItem work;

  const WorksViewerPage(this.work, {super.key});

  @override
  State<WorksViewerPage> createState() => _WorksViewerPageState();
}

class _WorksViewerPageState extends State<WorksViewerPage> {

  final _textController = TextEditingController();

  bool _isEditMode = false;

  String _editModeText = "Edit";

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      appBar: AppBar(
        leading: const BackButton(color: Colors.redAccent),
        title: const Text("Works"),
        titleTextStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        centerTitle: true,
        backgroundColor: Colors.black87,
        actions: <Widget>[
          TextButton(
            onPressed: _editModeToggle,
            child: Text(
              _editModeText,
              style: const TextStyle(fontSize:20, color: Colors.redAccent),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: Text(widget.work.title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),)),
          Expanded(
            child: Container(
                child: Image(image: widget.work.picture)
              )
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text("Notes", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20))),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 7, vertical: 5),
              color: Colors.black12,
              child: ListView.builder(
              itemCount: widget.work.comments.length + 1,
              itemBuilder: (context, index) {
                if (index == widget.work.comments.length)
                {
                  return Center(
                    heightFactor: 2,
                    child: SizedBox(
                      height: 30,
                      child: FloatingActionButton(
                          heroTag: "AddSessionButton",
                          shape: const CircleBorder(),
                          backgroundColor: Colors.green,
                          onPressed: ()  {
                            showDialog(context: context, builder:(context)
                            {
                              return AlertDialog(
                                content: SizedBox(
                                    height: 300,
                                    child: Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.symmetric(vertical: 5),
                                            child: const Text("Add Note", style: TextStyle(color: Colors.black, fontSize: 20),)),
                                          SizedBox(
                                            width:250,
                                            child: TextField(
                                              style: const TextStyle(color: Colors.black, fontSize: 17),
                                              controller: _textController,
                                              onChanged: (value) {
                                                setState(() {

                                                });;
                                              },
                                              decoration: const InputDecoration(
                                                  labelText: "Enter Note",
                                                  labelStyle: TextStyle(color: Colors.black45, fontSize: 20),
                                                  border: OutlineInputBorder()
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 60,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              SizedBox(
                                                width: 100,
                                                child: FloatingActionButton(
                                                  child: const Text("Cancel"),
                                                  onPressed: (){
                                                    _textController.clear();
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                              ),
                                              SizedBox(
                                                width: 100,
                                                child: FloatingActionButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      if (_textController.text.isNotEmpty)
                                                      {
                                                        widget.work.addComment(_textController.text);
                                                        _textController.clear();
                                                      }
                                                    });
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text("Confirm"),
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
                          child: const Icon(Icons.add, color: Colors.white)),
                    ),
                  );
                }
                else
                {
                  return Container(
                      color: Colors.white10,
                      height: 80,
                      child: Row(
                        children: [
                          Visibility(
                            visible: _isEditMode,
                            child: IconButton(
                                onPressed: (){
                                  setState(() {
                                    widget.work.removeComment(widget.work.comments[index]);
                                  });
                                },
                                icon: const Icon(Icons.delete),
                                color: Colors.redAccent,
                                iconSize: 30
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left:10),
                            child: Text(
                              widget.work.comments[index],
                              style: const TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ],
                      )
                  );
                }
              },
                        ),
            ),
          )
        ],
      ),
    );
  }
}
