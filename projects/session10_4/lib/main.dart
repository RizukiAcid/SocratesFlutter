import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyBCACloneApp());
}

class MyBCACloneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'myBCA Clone',
      theme: ThemeData(
        primaryColor: Color(0xFF5AA5D2),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: HomeScreen(),
    );
  }
}