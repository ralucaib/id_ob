import 'package:flutter/material.dart';

import 'camera/camera_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const CameraScreen()),
            );
          },
          child: const Text('Începeți scanarea!'),
        ),
      ),
    );
  }
}