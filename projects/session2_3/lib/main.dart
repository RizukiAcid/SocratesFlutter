import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Basic UI'),
      ),
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children: <Widget>[
          Text(
            'Hello, Flutter!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _incrementCounter,
            child: Text('Press Me'),
          ),
          SizedBox(height: 20),
          Text(
            'Button pressed $_counter times',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 20),
          Image.network(
            'https://storage.googleapis.com/cms-storage-bucket/a9d6ce81aee44ae017ee.png',
            width: 100,
            height: 100,
          ),
          SizedBox(height: 20),
          Text(
            'Item 1',
            style: TextStyle(fontSize: 18),
          ),
          Text(
            'Item 2',
            style: TextStyle(fontSize: 18),
          ),
          Text(
            'Item 3',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}