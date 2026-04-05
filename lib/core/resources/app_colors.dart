import 'package:flutter/material.dart';

class AppColors {
  static const Color background = Color(0xFF0D1117);
  static const Color surface = Color(0xFF161B22);
  static const Color surfaceHover = Color(0xFF21262D);
  static const Color outline = Color(0xFF30363D);
  
  static const Color primary = Color(0xFF26C6DA); // Teal
  static const Color secondary = Color(0xFF00BFA5); // Green
  static const Color accent = Color(0xFF42A5F5); // Blue
  
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Color(0xFFB0BEC5);
  static const Color textDim = Colors.white38;

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, secondary],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
