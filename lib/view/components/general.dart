import 'dart:ffi';
import 'dart:core';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:general_waste_classifier/view/pages/accounts_page.dart';
import 'package:general_waste_classifier/view/pages/profile.dart';
import 'package:general_waste_classifier/view/components/floating_camera_button.dart';
import 'package:general_waste_classifier/view/pages/homepage.dart';
import '../pages/profile.dart';

class GeneralPage extends StatefulWidget {
  final String retrieveUserInputValue;
  final CameraDescription firstCamera;
  const GeneralPage({super.key, required this.retrieveUserInputValue, required this.firstCamera});

  @override
  State<GeneralPage> createState() => _GeneralPageState();
}

class _GeneralPageState extends State<GeneralPage> {

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        currentIndex: 1,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.arrowtriangle_right_circle),
            label: "recommendations",
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.camera),
            label: "camera",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_alt_circle_fill),
            label: "account",
            backgroundColor: Colors.black,
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return const AccountPage();
        } else if (index == 1) {
          return HomePage(camera: widget.firstCamera,);
        } else {
          return ProfilePage(obtainUserInputEmailAddress: widget.retrieveUserInputValue,);
        }
      },
    );
  }
}
