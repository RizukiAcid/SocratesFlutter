// main.dart
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyBCACloneApp());
}

class MyBCACloneApp extends StatelessWidget {
  const MyBCACloneApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'myBCA Clone',
      theme: ThemeData(
        primaryColor: const Color(0xFF5AA5D2),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF5AA5D2),
          foregroundColor: Colors.white,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}