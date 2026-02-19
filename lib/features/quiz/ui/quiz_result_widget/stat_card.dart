import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  final Color bg;
  final Color valueColor;
  final int value;
  final String label;

  const StatCard({super.key,
    required this.bg,
    required this.valueColor,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$value",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: valueColor,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: valueColor.withOpacity(0.95),
            ),
          ),
        ],
      ),
    );
  }
}
