import 'package:flutter/material.dart';
import 'package:lineai/src/core/theme/color_schemes.dart';

class AppTheme {
  static const _fontFamily = 'GeneralSans';
  static ThemeData _buildTheme({required Brightness brightness}) {
    final ColorScheme colors =
        brightness == Brightness.light ? lightColorScheme : darkColorScheme;

    return ThemeData.from(
      useMaterial3: true,
      textTheme: _buildTextTheme(colors: colors),
      colorScheme: colors,
    );
  }

  static TextTheme _buildTextTheme({required ColorScheme colors}) {
    return TextTheme(
      displayLarge: TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w700,
        fontSize: 32,
        color: colors.onBackground,
      ),
      bodyLarge: TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w600,
        fontSize: 16,
        color: colors.onBackground,
      ),
      bodyMedium: TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: colors.onBackground,
      ),
      bodySmall: TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: colors.onBackground,
      ),
    );
  }

  static final ThemeData lightTheme = _buildTheme(brightness: Brightness.light);

  static final ThemeData darkTheme = _buildTheme(brightness: Brightness.dark);
}
