import 'package:flutter/material.dart';

import '../../../../core/constants/app_color.dart';

class GradientBorderContainer extends StatelessWidget {
  final Widget child;
  final double borderWidth;
  final BorderRadius borderRadius;
  final Gradient gradient;
  final EdgeInsets padding;
  final Color? backgroundColor;

  const GradientBorderContainer({
    super.key,
    required this.child,
    this.borderWidth = 2,
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
    this.gradient = const LinearGradient(
      colors: [AppColor.gradient1, AppColor.gradient2, AppColor.gradient3],
    ),
    this.padding = const EdgeInsets.all(16),
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = backgroundColor ?? Theme.of(context).colorScheme.surface;

    return Container(
      padding: EdgeInsets.all(borderWidth),
      decoration: BoxDecoration(gradient: gradient, borderRadius: borderRadius),
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(
            (borderRadius.topLeft.x - borderWidth).clamp(0, double.infinity),
          ),
        ),
        child: child,
      ),
    );
  }
}
