import 'package:flutter/material.dart';
import 'dart:math' as math;

class LoadingIndicator extends StatefulWidget {
  final double size;

  LoadingIndicator({this.size = 50});

  @override
  _LoadingIndicatorState createState() => _LoadingIndicatorState();
}

class _LoadingIndicatorState extends State<LoadingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            painter: LoadingPainter(_controller.value),
          );
        },
      ),
    );
  }
}

class LoadingPainter extends CustomPainter {
  final double progress;

  LoadingPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5
      ..shader = SweepGradient(
        center: Alignment.center,
        startAngle: -math.pi / 2,
        endAngle: 3 * math.pi / 2,
        colors: [Colors.blue, Colors.green, Colors.yellow, Colors.red],
      ).createShader(Rect.fromCircle(center: center, radius: radius));

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2 + progress * 2 * math.pi,
      3 * math.pi / 2,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(LoadingPainter oldDelegate) =>
      oldDelegate.progress != progress;
}