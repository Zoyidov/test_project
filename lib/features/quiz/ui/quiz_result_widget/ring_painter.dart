import 'dart:math' as math;

import 'package:flutter/material.dart';

class RingPainter extends CustomPainter {
  final double value;
  final Color trackColor;
  final Color progressColor;
  final double strokeWidth;

  RingPainter({
    required this.value,
    required this.trackColor,
    required this.progressColor,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = (math.min(size.width, size.height) / 2) - strokeWidth / 2;
    final rect = Rect.fromCircle(center: center, radius: radius);

    final trackPaint = Paint()
      ..color = trackColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final progressPaint = Paint()
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(rect, 0, math.pi * 2, false, trackPaint);

    final sweep = (math.pi * 2) * value.clamp(0.0, 1.0);
    if (sweep > 0.0001) {
      canvas.drawArc(rect, -math.pi / 2, sweep, false, progressPaint);
    }
  }

  @override
  bool shouldRepaint(covariant RingPainter oldDelegate) {
    return oldDelegate.value != value ||
        oldDelegate.trackColor != trackColor ||
        oldDelegate.progressColor != progressColor ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
