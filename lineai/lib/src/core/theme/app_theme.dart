import 'package:flutter/material.dart';
import 'package:lineai/src/core/theme/theme.dart';

class AppTheme {
  static const _fontFamily = 'GeneralSans';

  static ThemeData get lightTheme => _buildTheme(brightness: Brightness.light);

  static ThemeData get darkTheme => _buildTheme(brightness: Brightness.dark);

  static ThemeData _buildTheme({required Brightness brightness}) {
    final MaterialTheme materialTheme = MaterialTheme(_buildTextTheme());
    return brightness == Brightness.dark ? materialTheme.dark() : materialTheme.light();
  }

  static TextTheme _buildTextTheme() {
    return const TextTheme(
      displayLarge: TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w700,
        fontSize: 32,
      ),
      headlineLarge: TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w700,
        fontSize: 28,
      ),
      titleLarge: TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w700,
        fontSize: 24,
      ),
      titleMedium: TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w700,
        fontSize: 20,
      ),
      titleSmall: TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w700,
        fontSize: 18,
      ),
      bodyLarge: TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
      bodyMedium: TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
      bodySmall: TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),
    );
  }
}
