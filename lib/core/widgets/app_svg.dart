import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppSvg extends StatelessWidget {
  final String path;
  final double? size;
  final Color? color;
  final VoidCallback? onTap;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;

  const AppSvg({
    super.key,
    required this.path,
    this.size,
    this.color,
    this.onTap,
    this.padding,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final widget = SvgPicture.asset(
      path,
      width: size,
      height: size,
      colorFilter: color != null
          ? ColorFilter.mode(color!, BlendMode.srcIn)
          : null,
    );

    if (onTap == null) return widget;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: borderRadius ?? BorderRadius.circular(8),
        onTap: onTap,
        child: Padding(
          padding: padding ?? const EdgeInsets.all(8),
          child: widget,
        ),
      ),
    );
  }
}
