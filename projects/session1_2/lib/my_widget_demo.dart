import 'package:flutter/material.dart';

class MyWidgetDemo extends StatefulWidget {
  const MyWidgetDemo({super.key});

  @override
  _MyWidgetDemoState createState() => _MyWidgetDemoState();
}

class _MyWidgetDemoState extends State<MyWidgetDemo> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Text Widget
          Container(
            padding: EdgeInsets.all(16.0),
            margin: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              'Hello, Flutter!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          // Image Widget
          Image.asset(
            'assets\\flutter_logo.png',
            width: 200,
            height: 200,
          ),
          // Button Widget
          ElevatedButton(
            onPressed: _incrementCounter,
            child: Text('Click Me'),
          ),
          // Counter Display
          Text(
            'Counter: $_counter',
            style: TextStyle(fontSize: 24),
          ),
          // Row Widget
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.star, color: Colors.red, size: 50),
              Icon(Icons.star, color: Colors.green, size: 50),
              Icon(Icons.star, color: Colors.blue, size: 50),
            ],
          ),
          // Column Widget
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Column Item 1'),
              Text('Column Item 2'),
              Text('Column Item 3'),
            ],
          ),
        ],
      ),
    );
  }
}