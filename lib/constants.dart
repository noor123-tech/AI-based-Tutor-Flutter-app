import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryBlue = Color(0xFF4B7BFF);
  static const Color primaryPurple = Color(0xFF9C4BFF);
  static const Color userBubble = Color(0xFF4B7BFF);
  static const Color aiBubble = Color(0xFFF2F4F7);
  static const Color textBlack = Color(0xFF1F2937);
  static const Color textGrey = Color(0xFF6B7280);
  static const Color inputBorder = Color(0xFFE5E7EB);
  static const Color buttonBlack = Color(0xFF000000);
  static const Color white = Colors.white;
}

const LinearGradient primaryGradient = LinearGradient(
  colors: [AppColors.primaryBlue, AppColors.primaryPurple],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);
