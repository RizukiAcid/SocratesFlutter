import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;
  late AnimationController _rotateController;
  late Animation<double> _rotateAnimation;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(parent: _fadeController, curve: Curves.easeIn);

    _scaleController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _scaleAnimation = CurvedAnimation(parent: _scaleController, curve: Curves.easeIn);

    _rotateController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _rotateAnimation = CurvedAnimation(parent: _rotateController, curve: Curves.easeIn);
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _scaleController.dispose();
    _rotateController.dispose();
    super.dispose();
  }

  void _toggleFade() {
    setState(() {
      _fadeController.isDismissed ? _fadeController.forward() : _fadeController.reverse();
    });
  }

  void _toggleScale() {
    setState(() {
      _scaleController.isDismissed ? _scaleController.forward() : _scaleController.reverse();
    });
  }

  void _toggleRotate() {
    setState(() {
      _rotateController.isDismissed ? _rotateController.forward() : _rotateController.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FadeTransition(
              opacity: _fadeAnimation,
              child: const Text(
                'Fade Animation',
                style: TextStyle(fontSize: 24),
              ),
            ),
            const SizedBox(height: 20),
            ScaleTransition(
              scale: _scaleAnimation,
              child: const Text(
                'Scale Animation',
                style: TextStyle(fontSize: 24),
              ),
            ),
            const SizedBox(height: 20),
            RotationTransition(
              turns: _rotateAnimation,
              child: const Text(
                'Rotate Animation',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: _toggleFade,
            tooltip: 'Toggle Fade',
            child: const Icon(Icons.flip),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: _toggleScale,
            tooltip: 'Toggle Scale',
            child: const Icon(Icons.zoom_out_map),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: _toggleRotate,
            tooltip: 'Toggle Rotate',
            child: const Icon(Icons.rotate_right),
          ),
        ],
      ),
    );
  }
}