import 'package:flutter/material.dart';
import 'package:portfolio/core/resources/app_colors.dart';

class PortfolioBackground extends StatelessWidget {
  const PortfolioBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.topLeft,
          radius: 1.5,
          colors: [
            Color(0xFF1E293B), // Deep navy/blue
            AppColors.background,
          ],
        ),
      ),
    );
  }
}
