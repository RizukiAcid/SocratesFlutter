import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() => runApp(const TokopediaClone());

class TokopediaClone extends StatelessWidget {
  const TokopediaClone({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tokopedia Clone',
      theme: ThemeData(
        primaryColor: const Color(0xFF3FAB3A),
        fontFamily: 'Roboto',
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF3FAB3A),
          elevation: 0,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}