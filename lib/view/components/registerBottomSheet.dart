import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:general_waste_classifier/view/pages/login_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class RegisterBottomSheet extends StatefulWidget {
  const RegisterBottomSheet({super.key});

  @override
  State<RegisterBottomSheet> createState() => _RegisterBottomSheetState();
}

class _RegisterBottomSheetState extends State<RegisterBottomSheet> {
  TextEditingController registerFormFirstNameController = TextEditingController();
  TextEditingController registerFormLastNameController = TextEditingController();
  TextEditingController registerFormEmailAddressController = TextEditingController();
  TextEditingController registerFormPasswordController = TextEditingController();
  TextEditingController registerFormConfirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0, right: 15.0),
              child: CircleAvatar(
                radius: 20.0,
                backgroundColor: const Color(0x1F000000),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.close,
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 35),
            child: const Text(
              "Sign Up To Level Up Your Mood",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              )
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 60),
            child: Column(
              children: [
                const SizedBox(height: 17.0,),
                RegisterFormFirstNameController(hintText: "First Name", textEditingController: registerFormFirstNameController,),
                const SizedBox(height: 17.0,),
                RegisterFormFirstNameController(hintText: "Last Name", textEditingController: registerFormLastNameController,),
                const SizedBox(height: 17.0,),
                RegisterFormFirstNameController(hintText: "Email Address", textEditingController: registerFormEmailAddressController,),
                const SizedBox(height: 17.0,),
                RegisterFormFirstNameController(hintText: "Enter password", textEditingController: registerFormPasswordController,),
                const SizedBox(height: 17.0,),
                RegisterFormFirstNameController(hintText: "Confirm your password", textEditingController: registerFormConfirmPasswordController,),
              ],
            ),
          ),
        ],
      )
    );
  }
}

class RegisterFormFirstNameController extends StatefulWidget {
  final String? hintText;
  final TextEditingController textEditingController;
  const RegisterFormFirstNameController({super.key, required this.hintText, required this.textEditingController});

  @override
  State<RegisterFormFirstNameController> createState() => _RegisterFormFirstNameControllerState();
}

class _RegisterFormFirstNameControllerState extends State<RegisterFormFirstNameController> {
  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    widget.textEditingController.addListener(_printLatestValue);
  }
  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    widget.textEditingController.dispose();
    super.dispose();
  }
  void _printLatestValue() {
    final text = widget.textEditingController.text;
    print('Second text field: $text (${text.characters.length})');
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 290,
      child: TextField(
        controller: widget.textEditingController,
        decoration: InputDecoration(
          labelText: widget.hintText,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}

