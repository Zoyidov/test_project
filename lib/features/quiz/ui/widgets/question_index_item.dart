import 'package:flutter/material.dart';
import 'active_indicator.dart';

class QuestionIndexItem extends StatelessWidget {
  final int index;
  final bool isActive;
  final bool? answered;
  final VoidCallback onTap;

  const QuestionIndexItem({
    super.key,
    required this.index,
    required this.isActive,
    required this.answered,
    required this.onTap,
  });

  static const double _itemW = 52;
  static const double _itemH = 46;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    Color bg;
    Color fg;

    if (answered != null) {
      bg = answered! ? const Color(0xFF2ECC71) : const Color(0xFFFF5A5A);
      fg = Colors.white;
    } else {
      bg = isDark ? const Color(0xFF0E1A2B) : Colors.white;
      fg = isDark ? Colors.white70 : Colors.black87;
    }

    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          ActiveIndicator(isVisible: isActive),

          AnimatedContainer(
            duration: const Duration(milliseconds: 160),
            width: _itemW,
            height: _itemH,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: bg,
              borderRadius: BorderRadius.circular(14),
              boxShadow:[
                      BoxShadow(
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                        color: Colors.black.withOpacity(isDark ? 0.35 : 0.10),
                      ),
                    ]
            ),
            child: Text(
              '${index + 1}',
              style: TextStyle(fontWeight: FontWeight.w800, color: fg),
            ),
          ),
        ],
      ),
    );
  }
}
