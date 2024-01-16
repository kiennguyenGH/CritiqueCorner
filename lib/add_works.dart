import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddWorksPage extends StatefulWidget {
  const AddWorksPage({super.key});

  @override
  State<AddWorksPage> createState() => _AddWorksPageState();
}

class _AddWorksPageState extends State<AddWorksPage> {

  final _textController = TextEditingController();

   File? _selectedImage;

  Future _selectImageFromGallery() async {
    final returnedImage = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnedImage == null) return;
    setState(() {
      _selectedImage = File(returnedImage!.path);
    });
  }

  Future _selectImageFromCamera() async {
    final returnedImage = await ImagePicker().pickImage(source: ImageSource.camera);

    if (returnedImage == null) return;
    setState(() {
      _selectedImage = File(returnedImage!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white12,
        appBar: AppBar(
          leading: const BackButton(color: Colors.redAccent),
          title: const Text("Add Work"),
          titleTextStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          centerTitle: true,
          backgroundColor: Colors.black87,

        ),
        body: Column(
          children: [
            Container(
              color: Colors.white12,
              // alignment: Alignment.center,
              height: 60,
              margin: const EdgeInsets.only(top: 30, left: 50, right: 50),
              child: _selectedImage != null ? Image.file(_selectedImage!) : TextField(
                style: const TextStyle(color: Colors.white, fontSize: 17),
                controller: _textController,
                decoration: const InputDecoration(
                    labelText: "Title",
                    labelStyle: TextStyle(color: Colors.white24, fontSize: 20),
                    border: OutlineInputBorder()
                ),
              ),
            ),
            Expanded(
              flex: 50,
              child: Container(
                color: Colors.black12,
                margin: const EdgeInsets.only(top:10),
                height: 300,
                width: 300,
                child: ListTile(
                  title: const Center(child: Icon(Icons.add_a_photo, color: Colors.white12, size: 150,)),
                  onTap: (){
                    showCupertinoModalPopup(context: context,
                      builder: (BuildContext context) => CupertinoActionSheet(
                        title: const Text("Select photo:", style: TextStyle(fontSize: 20),),
                        actions: <CupertinoActionSheetAction>[
                          CupertinoActionSheetAction(
                           onPressed: (){
                             _selectImageFromGallery();
                             // Navigator.pop(context);
                           },
                            child: const Text("From Gallery", style: TextStyle(color: Colors.blue, fontSize: 25))
                          ),
                          CupertinoActionSheetAction(
                            onPressed: (){
                              _selectImageFromCamera();
                              // Navigator.pop(context);
                            },
                            child: const Text("From Camera", style: TextStyle(color: Colors.blue, fontSize: 25))
                          ),
                        ],

                      )
                    );
                  },
                ),
              ),
            ),
            Expanded(
              flex: 20,
              child: Container()
            ),
            Container(
              margin: const EdgeInsets.only(top: 50),
              height: 50,
              width: 150,
              child: FloatingActionButton(
                onPressed:
                    () {Navigator.of(context).pop();},
                backgroundColor: Colors.redAccent,
                child: const Text(
                  "Confirm",
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top:15, bottom: 30),
              child: TextButton(onPressed: () {
                Navigator.pop(context);},
                  child: const Text("Cancel", style: TextStyle(fontSize: 17),)
              ),
            )
          ],
        )
    );
  }
}
