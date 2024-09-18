import 'package:flutter/material.dart';
import 'package:gamify/pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gamify',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: Homepage(),
    );
  }
}
