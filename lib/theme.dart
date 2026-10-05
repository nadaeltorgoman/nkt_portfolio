import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const bg = Color(0xFF0B1120);
  static const surface = Color(0xFF111A2E);
  static const surfaceHover = Color(0xFF16213A);
  static const border = Color(0xFF1F2B45);
  static const primary = Color(0xFF38BDF8);
  static const accent = Color(0xFF818CF8);
  static const text = Color(0xFFE2E8F0);
  static const muted = Color(0xFF94A3B8);
}

ThemeData buildTheme() {
  final base = ThemeData.dark(useMaterial3: true);
  final textTheme = GoogleFonts.interTextTheme(base.textTheme).apply(
    bodyColor: AppColors.text,
    displayColor: AppColors.text,
  );
  return base.copyWith(
    scaffoldBackgroundColor: AppColors.bg,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primary,
      secondary: AppColors.accent,
      surface: AppColors.surface,
    ),
    textTheme: textTheme,
  );
}

/// Breakpoints shared by every section.
extension Responsive on BuildContext {
  double get width => MediaQuery.sizeOf(this).width;
  bool get isMobile => width < 700;
  bool get isTablet => width >= 700 && width < 1100;
  double get gutter => isMobile ? 20 : 40;
}
