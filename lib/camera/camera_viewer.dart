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
        if (!controller.isInitialized) {
          return Container();
        }
        return SizedBox(
            child: Stack(
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const HomePage()), //fix pls
                      );
                    }, // icon of the button
                    style: ElevatedButton.styleFrom( // styling the button
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(20),
                      backgroundColor: Colors.white, // Button color
                    ),
                    child: const Icon(Icons.arrow_back_ios_new, color: Colors.green),
                  ),
                ),
              ],
            ));
      });
    }
  }

