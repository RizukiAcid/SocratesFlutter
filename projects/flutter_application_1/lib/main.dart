import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello World!'),
        ),
        body: Center(
          child: Container(
              color: Colors.lightBlue,
              width: 150,
              height: 50,
              child: Text('Hello World')),
        ),
      ),
    );
  }
}

// flutter run -d web-server --web-port=8080 --web-hostname=0.0.0.0Text
