import 'package:flutter/material.dart';

class ResultTimerRow extends StatelessWidget {
  final String left;
  final String right;

  const ResultTimerRow({super.key, required this.left, required this.right});

  @override
  Widget build(BuildContext context) {
    const orange = Color(0xFFF39C12);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.timer_outlined, size: 18, color: orange),
        const SizedBox(width: 6),
        Text(
          left,
          style: const TextStyle(color: orange, fontWeight: FontWeight.w600),
        ),
        const SizedBox(width: 10),
        Container(width: 1, height: 14, color: const Color(0xFFE5E7EB)),
        const SizedBox(width: 10),
        Text(
          right,
          style: const TextStyle(color: orange, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
