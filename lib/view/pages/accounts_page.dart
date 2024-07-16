import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../components/displaySettingSheet.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 60, left: 30),
                      child: CircleAvatar(
                        radius: 40,
                        child: Text(
                          "B",
                          style: TextStyle(
                            fontSize: 50,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 60, right: 25),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: (){},
                            child: const Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Icon(
                                size: 45,
                                CupertinoIcons.bell,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(100.0)),
                                  ),
                                enableDrag: true,
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return const displaySettingSheet();
                                  }
                              );
                            },
                            child: const Icon(
                              size: 45,
                              CupertinoIcons.settings,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 80, left: 30, right: 20),
                  child: SizedBox(
                    height: 30,
                    child: Text(
                      "Your daily recommendation",
                      style: TextStyle(
                        decoration: null,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 35),
                  child: SizedBox(
                    height: 100,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 30),
                            child: GestureDetector(
                                onTap: (){},
                                child: Container(
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(30)),
                                    color: Colors.red,
                                  ),
                                  height: 100,
                                  width: 150,
                                  child: const Center(
                                    child: Text(
                                      "placeholder",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: GestureDetector(
                              onTap: (){},
                              child: Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(30)),
                                  color: Colors.pinkAccent,
                                ),
                                height: 100,
                                width: 150,
                                child: const Center(
                                  child: Text(
                                    "placeholder",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: GestureDetector(
                              onTap: (){},
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(30)),
                                  color: Colors.blue,
                                ),
                                height: 100,
                                width: 150,
                                child: Center(
                                  child: Text(
                                    "placeholder",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 60, left: 30, right: 20),
                  child: SizedBox(
                    height: 30,
                    child: Text(
                      "More on ...",
                      style: TextStyle(
                        decoration: null,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 35),
                  child: SizedBox(
                    height: 100,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 30),
                            child: GestureDetector(
                              onTap: (){},
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(30)),
                                  color: Colors.red,
                                ),
                                height: 100,
                                width: 150,
                                child: Center(
                                  child: Text(
                                    "placeholder",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: GestureDetector(
                              onTap: (){},
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(30)),
                                  color: Colors.pinkAccent,
                                ),
                                height: 100,
                                width: 150,
                                child: Center(
                                  child: Text(
                                    "placeholder",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: GestureDetector(
                              onTap: (){},
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(30)),
                                  color: Colors.blue,
                                ),
                                height: 100,
                                width: 150,
                                child: Center(
                                  child: Text(
                                    "placeholder",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 60, left: 30, right: 20),
                  child: SizedBox(
                    height: 30,
                    child: Text(
                      "Your favorite",
                      style: TextStyle(
                        decoration: null,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 35),
                  child: SizedBox(
                    height: 100,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 30),
                            child: GestureDetector(
                              onTap: (){},
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(30)),
                                  color: Colors.red,
                                ),
                                height: 100,
                                width: 150,
                                child: Center(
                                  child: Text(
                                    "placeholder",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: GestureDetector(
                              onTap: (){},
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(30)),
                                  color: Colors.pinkAccent,
                                ),
                                height: 100,
                                width: 150,
                                child: Center(
                                  child: Text(
                                    "placeholder",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: GestureDetector(
                              onTap: (){},
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(30)),
                                  color: Colors.blue,
                                ),
                                height: 100,
                                width: 150,
                                child: Center(
                                  child: Text(
                                    "placeholder",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}


