import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:general_waste_classifier/view/pages/homepage.dart';

class FloatingCameraButton extends StatefulWidget {
  const FloatingCameraButton({super.key, });

  @override
  State<FloatingCameraButton> createState() => _FloatingCameraButtonState();
}

class _FloatingCameraButtonState extends State<FloatingCameraButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
        FloatingActionButton(
          onPressed: () {
            // HomePage();
          },
          child: const Icon(Icons.camera),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
