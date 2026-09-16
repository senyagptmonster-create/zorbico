import 'package:flutter/material.dart';

class ZorbicoTheme {
  static const bg = Color(0xFF100D16);
  static const surface = Color(0xFF1A1523);
  static const edge = Color(0xFF282036);
  static const accent = Color(0xFFC084FC); // Mystic Purple
  static const accentLight = Color(0xFFE9D5FF);
  static const ink = Color(0xFFFAF5FF);
  static const success = Color(0xFF10B981);
  static const muted = Color(0xFF8E849E);

  static ThemeData get themeData {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: bg,
      fontFamily: 'AppFont',
      primaryColor: accent,
      colorScheme: const ColorScheme.dark(
        primary: accent,
        surface: surface,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: bg,
        elevation: 0,
        foregroundColor: ink,
        iconTheme: IconThemeData(color: ink),
      ),
    );
  }
}
