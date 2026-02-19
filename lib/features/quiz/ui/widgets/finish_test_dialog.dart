import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/app_icons.dart';

class FinishTestDialog {
  static Future<bool?> show(
      BuildContext context, {
        String title = 'Haqiqatda ham testni\nyakunlashni hohlaysizmi?',
        String subtitle = 'Belgilnmagan test javoblari\nxato deb hisobga olinadi',
        String cancelText = 'Qaytish',
        String confirmText = 'Yakunlash',
      }) {
    return showGeneralDialog<bool?>(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'finish_test_dialog',
      barrierColor: Colors.black.withOpacity(0.18),
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (_, __, ___) => const SizedBox.shrink(),
      transitionBuilder: (context, anim, __, ___) {
        final curve = CurvedAnimation(parent: anim, curve: Curves.easeOutCubic);
        return Opacity(
          opacity: curve.value,
          child: Transform.scale(
            scale: 0.96 + (0.04 * curve.value),
            child: _FinishTestDialogBody(
              title: title,
              subtitle: subtitle,
              cancelText: cancelText,
              confirmText: confirmText,
            ),
          ),
        );
      },
    );
  }
}

class _FinishTestDialogBody extends StatelessWidget {
  final String title;
  final String subtitle;
  final String cancelText;
  final String confirmText;

  const _FinishTestDialogBody({
    required this.title,
    required this.subtitle,
    required this.cancelText,
    required this.confirmText,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final maxWidth = MediaQuery.sizeOf(context).width >= 600 ? 560.0 : 520.0;

    return SafeArea(
      child: Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: const SizedBox.expand(),
          ),
          Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxWidth),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Material(
                  color: theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(22),
                  clipBehavior: Clip.antiAlias,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(22, 18, 22, 18),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 4),
                        const _QuestionSvgIcon(),
                        const SizedBox(height: 16),

                        Text(
                          title,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontSize: 15,
                            height: 1.35,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF8192A5),
                          ),
                        ),
                        const SizedBox(height: 12),

                        Text(
                          subtitle,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontSize: 15,
                            height: 1.35,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF8192A5),
                          ),
                        ),
                        const SizedBox(height: 22),

                        Row(
                          children: [
                            Expanded(
                              child: _DialogBtn(
                                text: cancelText,
                                background: const Color(0xFFF1F5F9),
                                foreground: const Color(0xFF9AA7B8),
                                onTap: () => Navigator.of(context).pop(false),
                              ),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: _DialogBtn(
                                text: confirmText,
                                background: const Color(0xFFEF5350),
                                foreground: Colors.white,
                                onTap: () => Navigator.of(context).pop(true),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _QuestionSvgIcon extends StatelessWidget {
  const _QuestionSvgIcon();

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AppIcons.question,
      width: 86,
      height: 86,
    );
  }
}

class _DialogBtn extends StatelessWidget {
  final String text;
  final Color background;
  final Color foreground;
  final VoidCallback onTap;

  const _DialogBtn({
    required this.text,
    required this.background,
    required this.foreground,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Material(
        color: background,
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: onTap,
          child: Center(
            child: Text(
              text,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: foreground,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
