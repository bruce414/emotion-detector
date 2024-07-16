import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:general_waste_classifier/view/pages/accounts_page.dart';
import 'package:general_waste_classifier/view/pages/profile.dart';
import '../pages/login_page.dart';

class CustomizedBottomSheet extends StatefulWidget {
  const CustomizedBottomSheet({super.key,});

  @override
  State<CustomizedBottomSheet> createState() => _CustomizedBottomSheetState();
}

class _CustomizedBottomSheetState extends State<CustomizedBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "close me",
                ),
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => LogInPage()),
              //     );
              //   },
              //   child: Text(
              //     "Login",
              //   ),
              // ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AccountPage()),
                  );
                },
                child: const Text(
                  "Recommendation page",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
