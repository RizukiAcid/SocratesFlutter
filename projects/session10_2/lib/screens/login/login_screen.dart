import 'package:flutter/material.dart';
import '../home/home_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext c) => Scaffold(
    body: Padding(
      padding: EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(decoration: InputDecoration(labelText: 'Phone / Email')),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => Navigator.pushReplacement(c, MaterialPageRoute(builder: (_) => HomeScreen())),
            child: Text('Login'),
          ),
        ],
      ),
    ),
  );
}
