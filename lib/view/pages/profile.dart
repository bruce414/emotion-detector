import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:general_waste_classifier/view/components/general.dart';
import 'package:general_waste_classifier/view/pages/login_page.dart';

class ProfilePage extends StatefulWidget {
  final String obtainUserInputEmailAddress;
  const ProfilePage({super.key, required this.obtainUserInputEmailAddress,});

  @override
  State<ProfilePage> createState() => _ChartsState();
}

class _ChartsState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: PhotoEngine(userInputEmailAddress: widget.obtainUserInputEmailAddress,),
              ),
              const SizedBox(height: 50,),
              const Padding(
                padding: EdgeInsets.only(right: 200),
                child: Text(
                  'Your photos',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ),
             const SizedBox(
               height: 5.0,
             ),
             const Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                 PhotosCollectionSortingButtons(text: "sort by"),
                 PhotosCollectionSortingButtons(text: "Select"),
               ],
              ),
              const SizedBox(height: 10.0,),
              const Expanded(child: PhotosCollection()),
            ],
          ),
        ),
      ),
    );
  }
}

class PhotoEngine extends StatefulWidget {
  final String userInputEmailAddress;
  const PhotoEngine({super.key, required this.userInputEmailAddress,});

  @override
  State<PhotoEngine> createState() => _PhotoEngineState();
}

class _PhotoEngineState extends State<PhotoEngine> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: const Color(0x1F000000),
      ),
      width: 340,
      height: 250,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(builder: (context) => GeneralPage(retrieveUserInputValue: myLoginEmailAddressController.text,))
                      // );
                    },
                    child: const CircleAvatar(
                      backgroundColor: Colors.blue,
                      minRadius: 40,
                      child: Icon(
                        Icons.camera_alt_outlined,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  const Text(
                    'Change Photo',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  const Text(
                    'About you',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    'Name',
                  ),
                  const Text(
                    'Cristiano Ronaldo',
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    'Email address',
                  ),
                  Text(
                    widget.userInputEmailAddress,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PhotosCollectionSortingButtons extends StatelessWidget {
  final String text;
  const PhotosCollectionSortingButtons({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      onPressed: (){},
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}


class PhotosCollection extends StatelessWidget {
  const PhotosCollection({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(20.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: 12,
      primary: true,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.teal,
          ),
        );
      },
    );
  }
}

