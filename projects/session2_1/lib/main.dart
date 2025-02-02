import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({required this.title, super.key});

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(color: Colors.blue[500]),
      child: Row(
        children: [
          const IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null,
          ),
          Expanded(
            child: title,
          ),
          const IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  const MyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          MyAppBar(
            title: Text(
              'Example title',
              style: Theme.of(context).primaryTextTheme.titleLarge,
            ),
          ),
          const Expanded(
            child: Center(
              child: Text('Hello, world!'),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.amber,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text('Row 1, Item 1'),
                    Text('Row 1, Item 2'),
                    Text('Row 1, Item 3'),
                  ],
                ),
                const SizedBox(height: 20),
                Stack(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.red,
                    ),
                    Container(
                      width: 80,
                      height: 80,
                      color: Colors.green,
                    ),
                    Container(
                      width: 60,
                      height: 60,
                      color: Colors.blue,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      title: 'My app',
      home: SafeArea(
        child: MyScaffold(),
      ),
    ),
  );
}