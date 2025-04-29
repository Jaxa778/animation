// import 'package:animation/mashq3.dart';
// import 'package:animation/mashq_1_2.dart';
import 'package:animation/mashq4.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Mashq4(),
    );
  }
}
