import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite_v2/tflite_v2.dart';


class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  late File _image;
  final picker = ImagePicker();
  bool isImgLoaded = false;

  @override
  void initState(){
    super.initState();
    _initTflite().then((value){
      setState(() {
      });
    });
  }

  detectImage(File image) async {
    await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2,
      threshold: 0.05,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
    });
  }

  _initTflite() async{
    await Tflite.loadModel(
        model: "assets/ssd_mobilenet.tflite",
        labels: "assets/ssd_mobilenet.txt",
        numThreads: 1, // defaults to 1
        isAsset: true, // defaults to true, set to false to load resources outside assets
        useGpuDelegate: false // defaults to false, set to true to use GPU delegate
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  pickImage() async{
    var img = await picker.pickImage(source: ImageSource.gallery);
    if(img==null) {
      return;
    } else{
    setState(() {
      _image = File(img.path);
      isImgLoaded = true;
    });
    detectImage(_image);
  }
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
                    image: FileImage(_image),
                  fit: BoxFit.contain
                )
              ),
            ),
          ) : Container(),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        pickImage();},
        backgroundColor: Colors.green,
        child: const Icon(Icons.add_photo_alternate_outlined),
    ));
  }
}
