import 'package:critique_corner/session_list.dart';
import 'package:flutter/material.dart';

class SessionPlayerPage extends StatefulWidget {

  final SessionList session;

  const SessionPlayerPage(this.session, {super.key});
  @override
  State<SessionPlayerPage> createState() => _SessionPlayerPageState();
}

class _SessionPlayerPageState extends State<SessionPlayerPage> {

  int index = 0;

  String twoDigits(int num)
  {
    return num.toString().padLeft(2, '0');
  }

  void resetIndex()
  {
    setState(() {
      index = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white12,
        appBar: AppBar(
          leading: const BackButton(color: Colors.redAccent),
          title: const Text("Session Player"),
          titleTextStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          centerTitle: true,
          backgroundColor: Colors.black87,
          leadingWidth: 80,
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 50, top:50),
              alignment: Alignment.centerLeft,
              child: Text(widget.session.listLabel, style: const TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold),)
            ),
            Container(
                margin: const EdgeInsets.only(left: 50),
                alignment: Alignment.centerLeft,
                child: Text(widget.session.list[index].sessionLabel, style: const TextStyle(color: Colors.white, fontSize: 35,),)
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal:45),
              decoration: BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(twoDigits(widget.session.list[index].timeLength.inHours.remainder(60)),
                    style: const TextStyle(color: Colors.white, fontSize: 50),
                  ),
                  Text(twoDigits(widget.session.list[index].timeLength.inMinutes.remainder(60)),
                    style: const TextStyle(color: Colors.white, fontSize: 50),
                  ),
                  Text(twoDigits(widget.session.list[index].timeLength.inSeconds.remainder(60)),
                    style: const TextStyle(color: Colors.white, fontSize: 50),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top:40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    heroTag: "PlayButton",
                    onPressed: (){},
                    child: Icon(Icons.play_arrow),),
                  SizedBox(width: 30),
                  FloatingActionButton(
                    heroTag: "StopButton",
                    onPressed: (){},
                    child: Icon(Icons.stop),),
                ],
              ),
            ),
          ],
        )
    );
  }
}
