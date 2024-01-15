import 'package:critique_corner/session_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddSessionItemPage extends StatefulWidget {
  const AddSessionItemPage({super.key});

  @override
  State<AddSessionItemPage> createState() => _AddSessionItemPageState();
}

class _AddSessionItemPageState extends State<AddSessionItemPage> {

  final _textController = TextEditingController();

  var hourList = List<Text>.generate(24, (i) => Text(i.toString()));
  var minList = List<Text>.generate(60, (i) => Text(i.toString()));
  int hour = 0;
  int min = 0;
  int sec = 0;

  bool _isTextFieldNotEmpty = false;
  Color buttonColor = Colors.white24;

  void isEmpty()
  {
    setState(() {
      if (_textController.text.isNotEmpty && (hour + min + sec != 0))
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

  String twoDigits(int num)
  {
    return num.toString().padLeft(2, '0');
  }

  void changeHour(int num)
  {
    setState(() {
      hour = num;
    });
  }

  void changeMin(int num)
  {
    setState(() {
      min = num;
    });
  }

  void changeSec(int num)
  {
    setState(() {
      sec = num;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white12,
        appBar: AppBar(
          leading: const BackButton(color: Colors.redAccent),
          title: const Text("Add Timer"),
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
                        labelText: "Label",
                        labelStyle: TextStyle(color: Colors.white24, fontSize: 20),
                        border: OutlineInputBorder()
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width:90,
                    child: FloatingActionButton(
                      heroTag: "HourButton",
                      backgroundColor: Colors.white24,
                      onPressed: (){
                        showCupertinoModalPopup(
                            context: context,
                            builder: (_) => SizedBox(
                                width: double.infinity,
                                height: 250,
                                child: CupertinoPicker(
                                  backgroundColor: Colors.white,
                                  itemExtent: 30,
                                  scrollController: FixedExtentScrollController(
                                      initialItem: hour
                                  ),
                                  children: hourList,
                                  onSelectedItemChanged: (int value) {
                                    changeHour(value);
                                    isEmpty();
                                  },
                                )
                            )
                        );
                      },
                      child: Text(twoDigits(hour), style: const TextStyle(color: Colors.white, fontSize: 20),),
                    ),
                  ),
                  const SizedBox(width:10),
                  const Text(":", style: TextStyle(color: Colors.white, fontSize: 30)),
                  const SizedBox(width:10),
                  SizedBox(
                    width:90,
                    child: FloatingActionButton(
                      heroTag: "MinButton",
                      backgroundColor: Colors.white24,
                      child: Text(
                        twoDigits(min),
                        style: const TextStyle(color: Colors.white, fontSize: 20),),
                      onPressed: (){
                        showCupertinoModalPopup(
                            context: context,
                            builder: (_) => SizedBox(
                              width: double.infinity,
                              height: 250,
                              child: CupertinoPicker(
                                backgroundColor: Colors.white,
                                itemExtent: 30,
                                scrollController: FixedExtentScrollController(
                                  initialItem: min
                                ),
                                children: minList,
                                onSelectedItemChanged: (int value) {
                                  changeMin(value);
                                  isEmpty();
                                },
                              )
                            )
                        );
                      },

                    ),
                  ),
                  const SizedBox(width:10),
                  const Text(":", style: TextStyle(color: Colors.white, fontSize: 30)),
                  const SizedBox(width:10),
                  SizedBox(
                    width:90,
                    child: FloatingActionButton(
                      heroTag: "SecondsButton",
                      backgroundColor: Colors.white24,
                      onPressed: (){
                        showCupertinoModalPopup(
                            context: context,
                            builder: (_) => SizedBox(
                                width: double.infinity,
                                height: 250,
                                child: CupertinoPicker(
                                  backgroundColor: Colors.white,
                                  itemExtent: 30,
                                  scrollController: FixedExtentScrollController(
                                      initialItem: sec
                                  ),
                                  children: minList,
                                  onSelectedItemChanged: (int value) {
                                    changeSec(value);
                                    isEmpty();
                                  },
                                )
                            )
                        );
                      },
                      child: Text(twoDigits(sec),
                        style: const TextStyle(color: Colors.white, fontSize: 20),),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child:const  Row(children: [
                  SizedBox(width: 30),
                  Text("Hours", style: TextStyle(color: Colors.white, fontSize: 17)),
                  SizedBox(width: 70),
                  Text("Minutes", style: TextStyle(color: Colors.white, fontSize: 17)),
                  SizedBox(width: 50),
                  Text("Seconds", style: TextStyle(color: Colors.white, fontSize: 17)),
                ],),
              ),

              Container(
                margin: const EdgeInsets.only(top: 50),
                height: 50,
                width: 150,
                child: FloatingActionButton(
                  heroTag: "ConfirmButton",
                  onPressed: (_isTextFieldNotEmpty) ? () {
                  Navigator.of(context).pop(
                    SessionItem(_textController.text, Duration(hours: hour, minutes: min, seconds: sec))
                  );} : null,
                  backgroundColor: buttonColor,
                  child: const Text(
                    "Confirm",
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top:15),
                child: Center(
                  child: TextButton(onPressed: () {
                    Navigator.pop(context);},
                      child: const Text("Cancel", style: TextStyle(fontSize: 17),)
                  ),
                ),
              )
            ]
        )
    );
  }
}
