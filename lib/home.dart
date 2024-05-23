import 'package:flutter/material.dart';
import 'package:id_ob/gallery.dart';

import 'camera/camera_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const CameraScreen()),
                );
              },
              child: const Text('Începeți detectarea în timp real!'),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const GalleryScreen()),
                );
              },
              child: const Text('Încărcați o imagine din galerie!'),
            ),
          ),
        ],
      ),
    );
  }
}