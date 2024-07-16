import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:general_waste_classifier/main.dart';
import '../components/floating_camera_button.dart';
import '../components/general.dart';
import '../components/bottomSheet.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class HomePage extends StatefulWidget {
  final CameraDescription camera;
  const HomePage({super.key, required this.camera});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late CameraController _cameraController;
  late Future<void> _initializeControllerFuture;
  @override
  void initState() {
    super.initState();
    _cameraController = CameraController(widget.camera, ResolutionPreset.max);
    _initializeControllerFuture = _cameraController.initialize();
  }
  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }
  // @override
  // void initState() {
  //   super.initState();
  //   _cameraController = CameraController(cameras[0], ResolutionPreset.medium);
  //   _cameraController.initialize().then((_) {
  //     if (!mounted) {
  //       return;
  //     }
  //     setState(() {});
  //   }).catchError((Object e) {
  //     if (e is CameraException) {
  //       switch (e.code) {
  //         case 'CameraAccessDenied':
  //           print("access was denied");
  //           break;
  //         default:
  //           print(e.description);
  //           break;
  //       }
  //     }
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final deviceRatio = size.width / size.height;
    return Scaffold(
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              children: [
                Center(
                  child: Transform.scale(
                    scale: _cameraController.value.aspectRatio/deviceRatio,
                    child: AspectRatio(
                      aspectRatio: _cameraController.value.aspectRatio,
                      child: CameraPreview(_cameraController),
                    ),
                  ),
                )
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator(),);
          }
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 45.0),
        child: FloatingActionButton(
          onPressed: () async {
            try {
              await _initializeControllerFuture;
              final image = await _cameraController.takePicture();
              if (!context.mounted) return;

              // If the picture was taken, display it on a new screen.
              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DisplayPictureScreen(
                    // Pass the automatically generated path to
                    // the DisplayPictureScreen widget.
                    imagePath: image.path,
                  ),
                ),
              );
            } catch (e) {
              // If an error occurs, log the error to the console.
              print(e);
            }
          },
          child: const Icon(Icons.camera_alt),
        ),
      ),
      // body: Stack(
      //   children: [
      //     // Container(
      //     //   height: double.infinity,
      //     //   child: CameraPreview(_cameraController),
      //     // ),
      //     Padding(
      //       padding: const EdgeInsets.only(top: 50),
      //       child: Align(
      //         alignment: Alignment.topCenter,
      //         child: ElevatedButton(
      //             onPressed: () {
      //               showCupertinoModalBottomSheet(
      //                   isDismissible: false,
      //                   enableDrag: true,
      //                   barrierColor: Colors.transparent,
      //                   expand: false,
      //                   shape: const RoundedRectangleBorder(
      //                     borderRadius: BorderRadius.vertical(
      //                         top: Radius.circular(100.0)),
      //                   ),
      //                   context: context,
      //                   builder: (BuildContext context) {
      //                     return CustomizedBottomSheet();
      //                   }
      //               );
      //             },
      //             child: const Text(
      //               "open me",
      //             )
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Image.file(File(imagePath)),
    );
  }
}


