import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:id_ob/home.dart';

import '../scan_controller.dart';

class CameraViewer extends StatelessWidget {
  const CameraViewer({super.key});

  @override
    Widget build(BuildContext context) {
      return GetX<ScanController>(builder: (controller) {
        var confidence = controller.confid.toStringAsFixed(2);
        if (!controller.isInitialized) {
          return Container();
        }
        return Scaffold(
          appBar: AppBar(title: const Text("Detectare obiecte",
          style: TextStyle(color: Colors.white, fontSize: 20),),
            leading: IconButton( color: Colors.white,
              icon: const Icon(Icons.arrow_back_ios_new),
              onPressed: () {Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()), //fix pls
              );},
            ),
            backgroundColor: Colors.green,),
            body: Stack(
              children: [
                CameraPreview(controller.cameraController),
                Positioned(
                  top: controller.y * 752,
                  left: controller.x * 360,
                  child: Container(
                    width: controller.w * 100 * context.width / 100,
                    height: controller.h * 100 * context.height / 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.green, width: 4.0)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          color: Colors.green,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                  controller.label,
                                style: const TextStyle(fontSize: 16, color: Colors.white),
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.green,
                width: double.infinity,
                constraints: const BoxConstraints(
                  minHeight: 30.0, // Minimum height constraint for the bar
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Încrederea detectării: $confidence%',
                    style: const TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
              ],
            ));
      });
    }
  }

