import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CounterProvider(),
      child: MyApp(),
    ),
  );
}

class CounterProvider extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter _router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => MyHomePage(),
        ),
        GoRoute(
          path: '/second',
          builder: (context, state) => SecondPage(),
        ),
      ],
    );

    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo Home Page'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('You have pushed the button this many times:'),
                Consumer<CounterProvider>(
                  builder: (context, counterProvider, child) {
                    return AnimatedContainer(
                      duration: Duration(seconds: 1),
                      color: counterProvider.counter % 2 == 0 ? Colors.blue : Colors.red,
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        '${counterProvider.counter}',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    );
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<CounterProvider>().incrementCounter();
                  },
                  child: Text('Increment Counter'),
                ),
                ElevatedButton(
                  onPressed: () {
                    GoRouter.of(context).go('/second');
                  },
                  child: Text('Go to Second Page'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Text('This is the second page'),
      ),
    );
  }
}