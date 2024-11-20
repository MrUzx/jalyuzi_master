// Dark mode uchun tema
import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.blueGrey,
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: AppBarTheme(
    color: Color(0xFF009C10),
    iconTheme: const IconThemeData(color: Colors.white),
    toolbarTextStyle: const TextTheme(
      titleLarge: TextStyle(color: Colors.white, fontSize: 20),
    ).bodyMedium,
    titleTextStyle: const TextTheme(
      titleLarge: TextStyle(color: Colors.white, fontSize: 20),
    ).titleLarge,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white70),
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: Colors.orange,
    error: Colors.red,
  ),
);
