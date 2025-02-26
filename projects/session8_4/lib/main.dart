// lib/main.dart
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'home_page.dart';  // We'll create this next

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Hive for Flutter.
  await Hive.initFlutter();
  // Open a box called 'notes' to store our notes.
  await Hive.openBox('notes');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Animation & Hive Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}
