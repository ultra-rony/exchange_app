import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  fontFamily: 'Inter',
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
  scaffoldBackgroundColor: Colors.white,
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headlineMedium: TextStyle(fontSize: 16, color: Colors.black87),
    headlineSmall: TextStyle(fontSize: 12, color: Colors.black54),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all<Color>(Colors.blue),
      foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
    ),
  ),
);
