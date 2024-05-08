import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:id_ob/camera/camera_screen.dart';

import 'global_bindings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false ,
      home: const CameraScreen(),
      title: "Camera App",
      initialBinding: GlobalBindings(),
    );
  }
}
