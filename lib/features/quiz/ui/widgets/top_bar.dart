import 'package:flutter/material.dart';
import 'package:test_project/features/quiz/ui/widgets/report_issue_dilog.dart';

import '../../../../core/constants/app_icons.dart';
import '../../../../core/widgets/app_svg.dart';
import 'finish_test_dialog.dart';

class TopBar extends StatelessWidget {
  final VoidCallback onToggleTheme;
  final int remainingSeconds;
  final VoidCallback onFinish;

  const TopBar({
    super.key,
    required this.onToggleTheme,
    required this.remainingSeconds,
    required this.onFinish,
  });

  String _format(int seconds) {
    final m = seconds ~/ 60;
    final s = seconds % 60;
    return "${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final barBg = isDark ? const Color(0xFF0E1A2B) : Colors.white;
    final pillBg = isDark ? Colors.white10 : const Color(0xFFF4F6FA);


    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: barBg,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            offset: const Offset(0, 4),
            color: Colors.black.withOpacity(isDark ? 0.35 : 0.10),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppSvg(
            path: AppIcons.logout,
            size: 24,
            onTap: () async {
              final result = await FinishTestDialog.show(context);

              if (result == true) {
                onFinish();
              }
            },
          ),
          Row(
            children: [
              AppSvg(
                onTap: () async {
                  final res = await ReportIssueDialog.show(
                    context,
                    initialText: "",
                  );

                  if (res != null) {}
                },
                path: AppIcons.message,
                size: 24,
              ),
              const SizedBox(width: 18),
              isDark
                  ? IconButton(
                      onPressed: onToggleTheme,
                      icon: Icon(Icons.wb_sunny_outlined),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    )
                  : AppSvg(
                      onTap: onToggleTheme,
                      path: AppIcons.theme,
                      size: 24,
                    ),
            ],
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: pillBg,
              borderRadius: BorderRadius.circular(999),
            ),
            child: Row(
              children: [
                AppSvg(path: AppIcons.timer, size: 20),
                const SizedBox(width: 6),
                Text(
                  _format(remainingSeconds),
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
