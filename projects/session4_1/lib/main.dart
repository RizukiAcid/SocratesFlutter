import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Step 1: Define the State Model
class CounterModel extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners(); // Notify listeners about the state change
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Step 3: Consume the State Model
            Consumer<CounterModel>(
              builder: (context, counter, child) {
                return Text(
                  'Count: ${counter.count}',
                  style: TextStyle(fontSize: 24),
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                // Access the state model and modify the state
                Provider.of<CounterModel>(context, listen: false).increment();
              },
              child: Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      // Step 2: Provide the State Model
      create: (context) => CounterModel(),
      child: MaterialApp(
        home: MyHomePage(),
      ),
    ),
  );
}