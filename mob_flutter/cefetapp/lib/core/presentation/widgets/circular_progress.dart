import 'dart:math' as math;

import 'package:flutter/material.dart';

class CircularProgressPainter extends CustomPainter {
  final Color color;
  final double value;
  final double maxValue;

  CircularProgressPainter(
      {@required this.color, @required this.value, @required this.maxValue});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.grey[300]
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);
    paint.color = color;
    double progressRadians = value / maxValue * 2 * math.pi;
    canvas.drawArc(
        Rect.fromCenter(
          center: size.center(Offset.zero),
          height: size.width,
          width: size.width,
        ),
        math.pi * 1.5,
        progressRadians,
        false,
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
