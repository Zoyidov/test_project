import 'package:flutter/material.dart';
import 'package:test_project/features/quiz/ui/quiz_result_widget/stat_card.dart';

class ResultStatsWrap extends StatelessWidget {
  final int correct;
  final int wrong;

  const ResultStatsWrap({
    super.key,
    required this.correct,
    required this.wrong,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, c) {
        const gap = 14.0;
        final itemWidth = (c.maxWidth - gap) / 2;

        return Wrap(
          spacing: gap,
          runSpacing: gap,
          children: [
            SizedBox(
              width: itemWidth,
              child: StatCard(
                bg: const Color(0xFFE7F9EE),
                valueColor: const Color(0xFF2ECC71),
                value: correct,
                label: "To‘g‘ri javob",
              ),
            ),
            SizedBox(
              width: itemWidth,
              child: StatCard(
                bg: const Color(0xFFF9E7E7),
                valueColor: const Color(0xFFE85B5B),
                value: wrong,
                label: "Noto‘g‘ri javob",
              ),
            ),
          ],
        );
      },
    );
  }
}
