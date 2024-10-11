import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
    primaryColor: Colors.blue,
    brightness: Brightness.light,
    textTheme: const TextTheme(
      displaySmall: TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      bodyLarge: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.blue),
        textStyle: WidgetStateProperty.all(
          const TextStyle(fontSize: 16.0, color: Colors.white),
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue, brightness: Brightness.dark),
    primaryColor: Colors.blue,
    brightness: Brightness.dark,
    textTheme: const TextTheme(
      displaySmall: TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyLarge: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.normal,
        color: Colors.white,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.blue),
        textStyle: WidgetStateProperty.all(
          const TextStyle(fontSize: 16.0, color: Colors.white),
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    ),
  );
}
