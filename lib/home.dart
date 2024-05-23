import 'package:flutter/material.dart';

import 'camera/camera_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Center(
            child: Image.asset('assets/icon.png'),
          ),
          const Center(
            child: Text("Identificați obiecte din mediul înconjurător în timp real", textAlign: TextAlign.center,style: TextStyle(
              color: Colors.green, fontSize: 20,
            ),),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const CameraScreen()),
                );
              },
              child: const Text('Începeți', style: TextStyle(color: Colors.green),),
            ),
          ),
          // Center(
          //   child: ElevatedButton(
          //     onPressed: () {
          //       Navigator.of(context).push(
          //         MaterialPageRoute(builder: (context) => const GalleryScreen()),
          //       );
          //     },
          //     child: const Text('Încărcați o imagine din galerie!'),
          //   ),
          // ),
        ],
      ),
    );
  }
}