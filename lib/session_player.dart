import 'dart:async';
import 'package:critique_corner/session_list.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class SessionPlayerPage extends StatefulWidget {

  final SessionList session;

  const SessionPlayerPage(this.session, {super.key});
  @override
  State<SessionPlayerPage> createState() => _SessionPlayerPageState();
}

class _SessionPlayerPageState extends State<SessionPlayerPage> {



  int index = 0;
  bool isPlaying = false;
  Duration duration = const Duration();
  IconData playIcon = Icons.play_arrow;
  Timer? timer;
  final player = AudioPlayer();

  @override
  void initState()
  {
    super.initState();
    duration = Duration(
        hours: widget.session.list[index].timeLength.inHours,
        minutes: widget.session.list[index].timeLength.inMinutes,
        seconds: widget.session.list[index].timeLength.inSeconds
    );
  }

  Future<void> playAudio() async {
    await player.play(AssetSource('timersoundeffect.mp3'));
  }

  @override
  void dispose()
  {
    player.dispose();
    timer?.cancel();
    super.dispose();
  }

  void addTime()
  {
    const addSeconds = -1;


    setState(() {
      final seconds = duration.inSeconds + addSeconds;

      if (seconds < 0 && index < widget.session.list.length - 1) {
        updateTimer();
      }
      else if (seconds < 0)
      {
        playAudio();
        timer?.cancel();
      }
      else
      {
        duration = Duration(seconds: seconds);
      }
    });
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime());
  }

  String twoDigits(int num)
  {
    return num.toString().padLeft(2, '0');
  }

  void updateTimer()
  {
    setState(() {
      playAudio();
      index++;
      duration = Duration(
          hours: widget.session.list[index].timeLength.inHours,
          minutes: widget.session.list[index].timeLength.inMinutes,
          seconds: widget.session.list[index].timeLength.inSeconds
      );
    });
  }

  void resetTimer()
  {
    if (isPlaying)
    {
      pauseTimer();
    }
    setState(() {
      isPlaying = false;
      playIcon = Icons.play_arrow;
      index = 0;
      duration = Duration(
          hours: widget.session.list[index].timeLength.inHours,
          minutes: widget.session.list[index].timeLength.inMinutes,
          seconds: widget.session.list[index].timeLength.inSeconds
      );
    });
  }

  void pauseTimer()
  {
    setState(() {
      timer?.cancel();
    });
  }

  void changeButton()
  {
    setState(() {
      isPlaying = !isPlaying;
      if (isPlaying) {
        startTimer();
        playIcon = Icons.pause;
      }
      else
      {
        pauseTimer();
        playIcon = Icons.play_arrow;
      }
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
                  Text(twoDigits(duration.inHours.remainder(60)),
                    style: const TextStyle(color: Colors.white, fontSize: 50),
                  ),
                  Text(twoDigits(duration.inMinutes.remainder(60)),
                    style: const TextStyle(color: Colors.white, fontSize: 50),
                  ),
                  Text(twoDigits(duration.inSeconds.remainder(60)),
                    style: const TextStyle(color: Colors.white, fontSize: 50),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top:40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    heroTag: "PlayButton",
                    shape: const CircleBorder(),
                    onPressed: (){
                      changeButton();
                    },
                    child: Icon(playIcon),),
                  const SizedBox(width: 30),
                  FloatingActionButton(
                    heroTag: "StopButton",
                    shape: const CircleBorder(),
                    onPressed: (){
                      resetTimer();
                    },
                    child: const Icon(Icons.stop),),
                ],
              ),
            ),
          ],
        )
    );
  }
}
