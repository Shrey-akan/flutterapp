import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    hintColor: Colors.green,
    brightness: Brightness.light,
    textTheme: const TextTheme(
      bodyText1: TextStyle(color: Colors.black),
      bodyText2: TextStyle(color: Colors.black),
    ),
    cardTheme: const CardTheme(
      color: Colors.white,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.indigo,
    hintColor: Colors.pink,
    brightness: Brightness.dark,
    textTheme: const TextTheme(
      bodyText1: TextStyle(color: Colors.white),
      bodyText2: TextStyle(color: Colors.white),
    ),
    cardTheme: const CardTheme(
      color: Colors.black,
    ),
  );
}
