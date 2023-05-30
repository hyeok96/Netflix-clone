import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/firebase_options.dart';
import 'package:netflix_clone/view/screen/mainScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Netflix-clone",
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        // colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
      ),
      home: MainScreen(),
    );
  }
}
