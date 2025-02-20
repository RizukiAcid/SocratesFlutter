// lib/main.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shared Preferences Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _textController = TextEditingController();
  String _savedValue = '';

  // Save the value using SharedPreferences
  Future<void> _saveValue() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('myKey', _textController.text);
    setState(() {
      _savedValue = _textController.text;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Value saved!')),
    );
  }

  // Load the saved value
  Future<void> _loadValue() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedValue = prefs.getString('myKey') ?? 'No value saved';
    });
  }

  // Remove the saved value (optional)
  Future<void> _removeValue() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('myKey');
    setState(() {
      _savedValue = 'Value removed';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shared Preferences Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _textController,
              decoration: const InputDecoration(
                labelText: 'Enter a value',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveValue,
              child: const Text('Save Value'),
            ),
            ElevatedButton(
              onPressed: _loadValue,
              child: const Text('Load Value'),
            ),
            ElevatedButton(
              onPressed: _removeValue,
              child: const Text('Remove Value'),
            ),
            const SizedBox(height: 20),
            Text(
              'Saved Value: $_savedValue',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
