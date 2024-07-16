import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:general_waste_classifier/logic/providers/userInputInfoProvider.dart';
import 'package:general_waste_classifier/view/pages/accounts_page.dart';
import 'package:general_waste_classifier/view/pages/login_page.dart';
import 'package:general_waste_classifier/view/pages/profile.dart';
import 'package:general_waste_classifier/view/components/general.dart';
import 'view/pages/homepage.dart';
import 'package:provider/provider.dart';

late List<CameraDescription> cameras;
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  final firstCamera = cameras.first;
  runApp(MyApp(firstCamera: firstCamera,));
}
// void main() {
//   // WidgetsFlutterBinding.ensureInitialized();
//   // cameras = await availableCameras();
//   // final firstCamera = cameras.first;
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  final CameraDescription firstCamera;
  const MyApp({super.key, required this.firstCamera});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserInputInfoProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true, colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple).copyWith(background: Colors.white),
        ),
        home: LogInPage(firstCamera: firstCamera,),
        // routes: {
        //   '/homepage': (context) => const HomePage(),
        //   '/chartspage': (context) => const Charts(),
        //   '/accountpage': (context) => const AccountPage(),
        // },
      ),
    );
  }
}


