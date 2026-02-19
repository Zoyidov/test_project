import 'package:flutter/material.dart';

ThemeData lightTheme() {
  final cs = ColorScheme.fromSeed(seedColor: Colors.indigo);
  return ThemeData(
    useMaterial3: true,
    colorScheme: cs,
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    navigationBarTheme: const NavigationBarThemeData(
      backgroundColor: Color(0xFFFFFFFF),
    ),
  );
}

ThemeData darkTheme() {
  const bg = Color(0xFF0B1220);
  const card = Color(0xFF0E1A2B);

  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: bg,
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF2F6BFF),
      surface: bg,
    ),
    navigationBarTheme: const NavigationBarThemeData(
      backgroundColor: card,
      indicatorColor: Color(0x332F6BFF),
    ),
  );
}
