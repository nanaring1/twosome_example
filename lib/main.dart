import 'package:flutter/material.dart';
import 'package:twosome_example/screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Twosome Clone',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}