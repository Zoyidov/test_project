import 'package:flutter/material.dart';

class AnswerTile extends StatelessWidget {
  final String label;
  final String text;
  final int index;
  final int? selectedIndex;
  final int correctIndex;
  final bool submitted;
  final VoidCallback onTap;

  const AnswerTile({
    super.key,
    required this.label,
    required this.text,
    required this.index,
    required this.selectedIndex,
    required this.correctIndex,
    required this.submitted,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final baseBg = isDark ? const Color(0xFF0E1A2B) : const Color(0xFFF0F1F3);

    Color bg = baseBg;

    if (submitted) {
      if (index == correctIndex) {
        bg = const Color(0xFF2ECC71);
      } else if (selectedIndex == index && index != correctIndex) {
        bg = const Color(0xFFFF5A5A);
      }
    } else {
      if (selectedIndex == index) {
        bg = isDark ? Colors.white : Colors.black.withOpacity(0.06);
      }
    }

    final textColor =
        (submitted &&
            (bg == const Color(0xFF2ECC71) || bg == const Color(0xFFFF5A5A)))
        ? Colors.white
        : (isDark ? Colors.white : Colors.black87);

    final labelColor =
        (submitted &&
            (bg == const Color(0xFF2ECC71) || bg == const Color(0xFFFF5A5A)))
        ? Colors.white
        : Color(0xFF006FE5);

    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              offset: const Offset(0, 0),
              color: Colors.grey,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 26,
                child: Text(
                  label,
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: labelColor,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(height: 1.25, color: textColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
