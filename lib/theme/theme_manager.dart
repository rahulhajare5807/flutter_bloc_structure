import 'package:flutter/material.dart';

class ThemeManager {
  // Using ValueNotifier for dynamic theme updates
  static ValueNotifier<ThemeData> themeNotifier = ValueNotifier(lightTheme);

  // Define light theme
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: Colors.teal,
      hintColor: Colors.amber,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.teal,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      textTheme: const TextTheme(
        bodySmall: TextStyle(color: Colors.black),
      ),
    );
  }

  // Define dark theme
  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: Colors.black,
      hintColor: Colors.amber,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      textTheme: const TextTheme(
        bodySmall: TextStyle(color: Colors.black),
      ),
    );
  }
}
