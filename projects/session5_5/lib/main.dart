import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter-Spring Boot Integration',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String apiResponse = 'Fetching...';

  @override
  void initState() {
    super.initState();
    fetchApiData();
  }

  Future<void> fetchApiData() async {
    try {
      // Adjust the URL if necessary.
      final response = await http.get(Uri.parse('http://localhost:8080/api/hello'));
      if (response.statusCode == 200) {
        setState(() {
          apiResponse = response.body;
        });
      } else {
        setState(() {
          apiResponse = 'Error: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        apiResponse = 'Exception: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter-Spring Boot Integration'),
      ),
      body: Center(
        child: Text(apiResponse, style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
