import 'package:flutter/material.dart';
import 'package:netflix_clone/view/screen/mainScreen.dart';

void main() {
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
