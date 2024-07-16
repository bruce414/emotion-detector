import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:general_waste_classifier/view/components/registerBottomSheet.dart';
import 'package:general_waste_classifier/view/pages/homepage.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../components/general.dart';

TextEditingController myLoginEmailAddressController = TextEditingController();

class LogInPage extends StatefulWidget {
  final CameraDescription firstCamera;
  const LogInPage({super.key, required this.firstCamera});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Logo
                const Icon(
                  CupertinoIcons.airplane,
                  color: Colors.blue,
                  size: 150,
                ),
                const SizedBox(height: 20.0,),
                //App name:
                const Text(
                  "Emotion",
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                  ),
                ),
                const Text(
                  "Detector",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20.0,),
                const LogInEmailAddress(hintText: "Email Address",),
                const SizedBox(height: 7.0,),
                const LogInPassword(hintText: "Password",),
                const SizedBox(height: 10.0,),
                const Text("--------------------OR--------------------"),
                const SizedBox(height: 10.0,),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GeneralPage(retrieveUserInputValue: myLoginEmailAddressController.text, firstCamera: widget.firstCamera,))
                    );
                  },
                  child: const SignInButton(
                      text: "Sign in with Apple",
                      bgColor: Colors.black,
                      imagePath: 'images/apple_logo_copy.jpeg',
                      imageWidth: 50.0,
                      imageHeight: 50.0,
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                ),
                const SizedBox(height: 9.0,),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GeneralPage(retrieveUserInputValue: myLoginEmailAddressController.text, firstCamera: widget.firstCamera,))
                    );
                  },
                  child: const SignInButton(
                      text: "Sign in with Google",
                      bgColor: Colors.white,
                      imagePath: 'images/google_logo.png',
                      imageWidth: 50,
                      imageHeight: 50,
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                ),
                const SizedBox(height: 10.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account? ",
                      style: TextStyle(
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        showCupertinoModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return const RegisterBottomSheet();
                            }
                        );
                      },
                      child: const Text(
                        "Register Now",
                        style: TextStyle(
                          color: Colors.blue,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class UserInputInfoProvider extends ChangeNotifier {
//
//
//   void updateUserInfo(String info) {
//     myLoginEmailAddressController.text = info;
//     notifyListeners();
//   }
//
//   @override
//   void dispose() {
//     myLoginEmailAddressController.dispose();
//     super.dispose();
//   }
// }



class LogInEmailAddress extends StatefulWidget {
  final String? hintText;
  const LogInEmailAddress({super.key, this.hintText});

  @override
  State<LogInEmailAddress> createState() => _LogInEmailAddressState();
}

class _LogInEmailAddressState extends State<LogInEmailAddress> {


  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    myLoginEmailAddressController.addListener(_printLatestValue);
  }
  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    myLoginEmailAddressController.dispose();
    super.dispose();
  }
  String getValue() {
    String inputEmailAddress = myLoginEmailAddressController.text;
    return inputEmailAddress;
  }
  void _printLatestValue() {
    final text = myLoginEmailAddressController.text;
    print('Second text field: $text (${text.characters.length})');
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 290,
        child: TextField(
          controller: myLoginEmailAddressController,
          decoration: InputDecoration(
            labelText: widget.hintText,
            border: const OutlineInputBorder(),
          ),
        ),
    );
  }
}

class LogInPassword extends StatefulWidget {
  final String? hintText;
  const LogInPassword({super.key, this.hintText});

  @override
  State<LogInPassword> createState() => _LogInPasswordState();
}

class _LogInPasswordState extends State<LogInPassword> {
  TextEditingController myLoginPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    myLoginPasswordController.addListener(_printLatestValue);
  }
  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    myLoginPasswordController.dispose();
    super.dispose();
  }
  void _printLatestValue() {
    final text = myLoginPasswordController.text;
    print('Second text field: $text (${text.characters.length})');
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 290,
      child: TextField(
        controller: myLoginPasswordController,
        decoration: InputDecoration(
          labelText: widget.hintText,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}


class SignInButton extends StatelessWidget {
  final String text;
  final Color bgColor;
  final String? imagePath;
  final double? imageWidth;
  final double? imageHeight;
  final TextStyle textStyle;

  const SignInButton({
    super.key,
    required this.text,
    required this.bgColor,
    required this.imagePath,
    required this.imageHeight,
    required this.imageWidth,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        width: 300,
        height: 80,
        padding: const EdgeInsets.only(left: 20, right: 20),
        margin: const EdgeInsets.symmetric(horizontal: 50),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: bgColor,
          border: Border.all(
            color: Colors.black,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 50, maxWidth: 50),
              child: Image(
                image: AssetImage(imagePath!),
                width: imageWidth,
                height: imageHeight,
              ),
            ),
            Text(
              text,
              style: textStyle,
            ),
          ],
        ),
      // child: Text(
      //   text,
      //   style: textStyle,
      // ),
    );
  }
}

