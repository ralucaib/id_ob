import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../scan_controller.dart';

class CameraViewer extends StatelessWidget {
  const CameraViewer({super.key});

  @override
    Widget build(BuildContext context) {
      return GetX<ScanController>(builder: (controller) {
        var isX = controller.x * 100;
        log("isX = $isX");
        if (!controller.isInitialized) {
          return Container();
        }
        return SizedBox(
            height: Get.height,
            width: Get.width,
            child: Stack(
              children: [
                CameraPreview(controller.cameraController),
                Positioned(
                  top: controller.y * 700,
                  right: controller.x * 500,
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
                          color: Colors.white,
                            child: Text(controller.label))
                      ],
                    ),
                  ),
                )
              ],
            ));
      });
    }
  }

