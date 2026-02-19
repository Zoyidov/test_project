import 'package:flutter/material.dart';

import '../../../../core/constants/app_icons.dart';
import '../../../../core/widgets/app_svg.dart';

class QuizFooter extends StatelessWidget {
  final int current;
  final int total;
  final VoidCallback onPrev;
  final VoidCallback onNext;
  final bool isLast;
  final bool canFinish;

  final VoidCallback onFinish;

  const QuizFooter({
    super.key,
    required this.current,
    required this.total,
    required this.onPrev,
    required this.onNext,
    required this.isLast,
    required this.canFinish,
    required this.onFinish,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final fg = isDark ? Colors.white54 : Colors.black38;

    return Padding(
      padding: const EdgeInsets.all(14),
      child: Row(
        children: [
          AppSvg(onTap: onPrev, path: AppIcons.leftArrow, size: 24),
          Expanded(
            child: Center(
              child: Text(
                "$current/$total",
                style: TextStyle(fontWeight: FontWeight.w700, color: fg),
              ),
            ),
          ),
          AppSvg(
            onTap: () {
              if (isLast) {
                if (canFinish) {
                  onFinish();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Avval testni yakunlang 🙂")),
                  );
                }
                return;
              }

              onNext();
            },
            path: AppIcons.rightArrow,
            size: 24,
          ),
        ],
      ),
    );
  }
}
