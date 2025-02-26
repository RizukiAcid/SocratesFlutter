// lib/rotating_widget.dart
import 'package:flutter/material.dart';

class RotatingWidget extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const RotatingWidget({
    Key? key,
    required this.child,
    this.duration = const Duration(seconds: 4),
  }) : super(key: key);

  @override
  State<RotatingWidget> createState() => _RotatingWidgetState();
}

class _RotatingWidgetState extends State<RotatingWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    // Create an animation controller that rotates continuously.
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: widget.child,
      builder: (context, child) {
        // Rotate from 0 to 2π radians.
        return Transform.rotate(
          angle: _controller.value * 2 * 3.1415926535897932,
          child: child,
        );
      },
    );
  }
}
