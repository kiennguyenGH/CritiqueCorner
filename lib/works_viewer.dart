import 'package:flutter/material.dart';
import 'work_item.dart';

class WorksViewerPage extends StatefulWidget {

  final WorkItem work;

  const WorksViewerPage(this.work, {super.key});

  @override
  State<WorksViewerPage> createState() => _WorksViewerPageState();
}

class _WorksViewerPageState extends State<WorksViewerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        leading: const BackButton(color: Colors.redAccent),
        title: const Text("Works"),
        titleTextStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        centerTitle: true,
        backgroundColor: Colors.black87,
      ),
      body: Column(
        children: [
          Text(widget.work.title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
          Expanded(child: Image(image: widget.work.picture))
        ],
      ),
    );
  }
}
