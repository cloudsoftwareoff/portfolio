import 'package:flutter/material.dart';
import 'package:portfolio/core/resources/app_colors.dart';

class PageScaffold extends StatelessWidget {
  final Widget child;
  const PageScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: AppColors.background,
      child: child,
    );
  }
}
