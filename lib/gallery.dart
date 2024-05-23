import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  late File pickedImage;
  bool isImgLoaded = false;

  getImageFromGallery() async{
    var tempStore = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      pickedImage = File(tempStore!.path);
      isImgLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Clasificare Imagine"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {Navigator.pop(context);},
        ),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          isImgLoaded ? Center(
            child: Container(
              height: 350,
              width: 350,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: FileImage(File(pickedImage.path)),
                  fit: BoxFit.contain
                )
              ),
            ),
          ) : Container(),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        getImageFromGallery();},
        backgroundColor: Colors.green,
        child: const Icon(Icons.add_photo_alternate_outlined),
    ));
  }
}
