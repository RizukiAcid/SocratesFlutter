// filepath: /C:/Storage/Repositories/SocratesFlutter/projects/session8_2/lib/main.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'db_helper.dart';
import 'database_factory.dart'; // Import the new database factory
import 'package:sqflite/sqflite.dart'; // Import sqflite

late DatabaseFactory databaseFactory;

void main() {
  databaseFactory = getDatabaseFactory(); // Initialize the database factory

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkTheme = false;

  @override
  void initState() {
    super.initState();
    _loadTheme();
  }

  _loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkTheme = prefs.getBool('isDarkTheme') ?? false;
    });
  }

  _toggleTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkTheme = !_isDarkTheme;
      prefs.setBool('isDarkTheme', _isDarkTheme);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: _isDarkTheme ? ThemeData.dark() : ThemeData.light(),
      home: MyHomePage(
        title: 'Flutter Demo Home Page',
        toggleTheme: _toggleTheme,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.toggleTheme});

  final String title;
  final Function toggleTheme;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();
  final DBHelper _dbHelper = DBHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: () => widget.toggleTheme(),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Enter your name'),
            ),
            ElevatedButton(
              onPressed: () async {
                await _dbHelper.insertUser(_controller.text);
                _controller.clear();
              },
              child: Text('Save to Database'),
            ),
            FutureBuilder<List<Map<String, dynamic>>>(
              future: _dbHelper.getUsers(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  final users = snapshot.data ?? [];
                  return Expanded(
                    child: ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(users[index]['name']),
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}