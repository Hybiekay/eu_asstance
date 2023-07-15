import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData.light().copyWith(
      useMaterial3: true,
      colorScheme: const ColorScheme.light(
          primary: Colors.green,
          onPrimary: Colors.white,
          secondary: Colors.black,
          background: Colors.white60,
          onSecondary: Colors.white));

  static ThemeData darkTheme = ThemeData.dark().copyWith(
      useMaterial3: true,
      colorScheme: const ColorScheme.dark(
          primary: Colors.green,
          onPrimary: Colors.white,
          secondary: Colors.green,
          background: Colors.white60,
          onSecondary: Colors.white60));
}
