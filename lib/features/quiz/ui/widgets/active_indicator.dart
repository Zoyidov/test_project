import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_project/core/constants/app_icons.dart';

class ActiveIndicator extends StatelessWidget {
  final bool isVisible;
  final Color color;

  const ActiveIndicator({
    super.key,
    required this.isVisible,
    this.color = const Color(0xFF2F6BFF),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 150),
        opacity: isVisible ? 1 : 0,
        child: Center(
          child: Transform.translate(
            offset: const Offset(0, -2),
            child: SvgPicture.asset(AppIcons.indicator),
          ),
        ),
      ),
    );
  }
}
