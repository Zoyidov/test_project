import 'package:flutter/material.dart';
import 'package:test_project/features/quiz/ui/quiz_result_widget/ring_painter.dart';

class SegmentedRingIndicator extends StatelessWidget {
  final double value;
  final String text;

  final Color trackColor;
  final double minSize;
  final double maxSize;
  final double textSize;
  final double strokeFactor;

  const SegmentedRingIndicator({
    super.key,
    required this.value,
    required this.text,
    this.trackColor = const Color(0xFFD8DEE8),
    this.minSize = 120,
    this.maxSize = 240,
    this.textSize = 24,
    this.strokeFactor = 0.085,
  });

  Color _autoColor(double v) {
    if (v <= 0.50) return const Color(0xFFE85B5B);
    if (v <= 0.70) return const Color(0xFFF59E0B);
    return const Color(0xFF2ECC71);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, c) {
        final available = c.maxWidth.isFinite
            ? c.maxWidth
            : MediaQuery.of(context).size.width;

        final size = (available * 0.55).clamp(minSize, maxSize);
        final stroke = (size * strokeFactor).clamp(8.0, 18.0);

        final v = value.clamp(0.0, 1.0);
        final color = _autoColor(v);

        return SizedBox(
          width: size,
          height: size,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomPaint(
                size: Size.square(size),
                painter: RingPainter(
                  value: v,
                  trackColor: trackColor,
                  progressColor: color,
                  strokeWidth: stroke,
                ),
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: textSize,
                  fontWeight: FontWeight.w600,
                  color: color,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

