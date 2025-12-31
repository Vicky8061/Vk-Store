import 'package:flutter/material.dart';

class AppTheme {
  // 🌞 Light Theme
  static final light = ThemeData(
    useMaterial3: true,
    primaryColor: const Color(0xFFff5722),
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
    ),

    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFff5722),
      brightness: Brightness.light, // ✅ MATCH
    ),

    cardColor: Colors.white,

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Color(0xFFff5722),
      unselectedItemColor: Colors.grey,
    ),
  );

  // 🌙 Dark Theme
  static final dark = ThemeData(
    useMaterial3: true,
    primaryColor: const Color(0xFFff5722),
    scaffoldBackgroundColor: const Color(0xFF121212),
    brightness: Brightness.dark,

    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF121212),
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
    ),

    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFff5722),
<<<<<<< HEAD
      brightness: Brightness.dark, // ✅ FIXED HERE
=======
      primary: const Color(0xFFff5722),
      brightness: Brightness.dark,
      surface: Color(0xFF121212),
>>>>>>> a9deaaa94b6d44bbd9942af207c48c69f8662df4
    ),

    cardColor: const Color(0xFF1E1E1E),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF1E1E1E),
      selectedItemColor: Color(0xFFff5722),
      unselectedItemColor: Colors.grey,
    ),
  );
}
