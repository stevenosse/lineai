import 'package:flutter/material.dart';
import 'package:lineai/src/core/theme/color_schemes.dart';

class AppTheme {
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
    return const TextTheme();
  }

  static final ThemeData lightTheme = _buildTheme(brightness: Brightness.light);

  static final ThemeData darkTheme = _buildTheme(brightness: Brightness.dark);
}
