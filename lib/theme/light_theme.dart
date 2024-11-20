import 'package:flutter/material.dart';

// Light mode uchun tema
final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Color(0xFF7265E2),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    color: Color(0xFF1ED760),
    iconTheme: const IconThemeData(color: Colors.white),
    toolbarTextStyle: const TextTheme(
      titleLarge: TextStyle(color: Color(0xFF7265E2), fontSize: 20,),
    ).bodyMedium,
    titleTextStyle: const TextTheme(
      titleLarge: TextStyle(color: Colors.white, fontSize: 20),
    ).titleLarge,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      fontSize: 32,
      color: Color(0xFF7265E2),
      fontWeight: FontWeight.w600,
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      color: Colors.black87,
      fontWeight: FontWeight.w500,
    ),
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: Colors.orange,
    error: Colors.red,
  ),
);
