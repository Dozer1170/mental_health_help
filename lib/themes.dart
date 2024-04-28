import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
  primaryColor: Colors.blueGrey,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.blueGrey,
    foregroundColor: Colors.white,
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      color: Colors.blueGrey,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: TextStyle(
      color: Colors.black,
      fontSize: 16,
    ),
  ),
);

final darkBackgroundColor = Colors.blueGrey.shade900;
final darkBackgroundColor2 = Colors.blueGrey.shade800;
final darkPrimaryColor = Colors.blueGrey.shade50;
final darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
  primaryColor: darkPrimaryColor,
  scaffoldBackgroundColor: darkBackgroundColor,
  appBarTheme: AppBarTheme(
    backgroundColor: darkBackgroundColor,
    foregroundColor: darkPrimaryColor,
  ),
  textTheme: TextTheme(
    titleLarge: TextStyle(
      color: darkPrimaryColor,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: TextStyle(
      color: darkPrimaryColor,
      fontSize: 16,
    ),
    headlineSmall: TextStyle(
      color: darkPrimaryColor,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  ),
  cardTheme: CardTheme(
    color: darkBackgroundColor2,
    elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(
      color: darkPrimaryColor,
      fontSize: 16,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: darkPrimaryColor, width: 2.0),
      borderRadius: BorderRadius.circular(10),
    ),
  ),
);
