import 'package:flutter/material.dart';

class ZorbicoPalette {
  static const bg = Color(0xFF100D16);
  static const surface = Color(0xFF1A1523);
  static const edge = Color(0xFF282036);
  static const accent = Color(0xFFC084FC);
  static const accent2 = Color(0xFFE9D5FF);
  static const ink = Color(0xFFFAF5FF);
  static const inkMuted = Color(0xFFA89BB5);

  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'AppFont',
      scaffoldBackgroundColor: bg,
      colorScheme: const ColorScheme.dark(
        surface: surface,
        primary: accent,
        secondary: accent2,
        onSurface: ink,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: surface,
        foregroundColor: ink,
        elevation: 0,
      ),
      drawerTheme: const DrawerThemeData(backgroundColor: surface),
    );
  }
}
