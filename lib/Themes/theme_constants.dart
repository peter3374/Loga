import 'package:flutter/material.dart';

// pay
ThemeData darkGreenMode = ThemeData(
    appBarTheme: const AppBarTheme(color: Colors.green),
    scaffoldBackgroundColor: Colors.black,
    hintColor: Colors.green,
    textTheme: const TextTheme(
      headline5: TextStyle(color: Colors.green),
      headline6: TextStyle(color: Colors.green),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(primary: Colors.green),
    ),
    brightness: Brightness.dark,
    accentColor: Colors.green, // buttons color + scroll effect color
    primaryColor: Colors.green, // appbar + textfield length
    buttonColor: Colors.green,
    dialogBackgroundColor: Colors.green);
// pay
ThemeData darkRedMode = ThemeData(
    appBarTheme: const AppBarTheme(color: Colors.red),
    scaffoldBackgroundColor: Colors.black,
    hintColor: Colors.red,
    textTheme: const TextTheme(
      headline5: TextStyle(color: Colors.red),
      headline6: TextStyle(color: Colors.red),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(primary: Colors.red),
    ),
    brightness: Brightness.dark,
    accentColor: Colors.red, // buttons color + scroll effect color
    primaryColor: Colors.red, // appbar + textfield length
    buttonColor: Colors.red,
    dialogBackgroundColor: Colors.red);

// pay
ThemeData darkPinkMode = ThemeData(
    appBarTheme: const AppBarTheme(color: Colors.pink),
    scaffoldBackgroundColor: Colors.black,
    hintColor: Colors.pink,
    textTheme: const TextTheme(
      headline5: TextStyle(color: Colors.pink),
      headline6: TextStyle(color: Colors.pink),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(primary: Colors.pink),
    ),
    brightness: Brightness.dark,
    accentColor: Colors.pink, // buttons color + scroll effect color
    primaryColor: Colors.pink, // appbar + textfield length
    buttonColor: Colors.pink,
    dialogBackgroundColor: Colors.pink);

ThemeData darkOrangeMode = ThemeData(
    appBarTheme: const AppBarTheme(color: Colors.deepOrangeAccent),
    scaffoldBackgroundColor: Colors.black,
    hintColor: Colors.deepOrangeAccent,
    textTheme: const TextTheme(
      headline5: TextStyle(color: Colors.deepOrangeAccent),
      headline6: TextStyle(color: Colors.deepOrangeAccent),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(primary: Colors.deepOrangeAccent),
    ),
    brightness: Brightness.dark,
    accentColor: Colors.deepOrangeAccent, // buttons color + scroll effect color
    primaryColor: Colors.deepOrangeAccent, // appbar + textfield length
    buttonColor: Colors.deepOrangeAccent,
    dialogBackgroundColor: Colors.deepOrangeAccent);

// middle day default theme
ThemeData darkMode = ThemeData(
    appBarTheme: const AppBarTheme(color: Colors.black),
    scaffoldBackgroundColor: Colors.black,
    hintColor: Colors.white,
    textTheme: const TextTheme(
      headline5: TextStyle(color: Colors.white),
      headline6: TextStyle(color: Colors.white),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(primary: Colors.white),
    ),
    brightness: Brightness.dark,
    accentColor: Colors.black, // buttons color + scroll effect color
    primaryColor: Colors.white, // appbar + textfield length
    buttonColor: Colors.white,
    dialogBackgroundColor: Colors.white);
// power light
ThemeData lightMode = ThemeData(
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all<Color>(Colors.black),
    ),
    appBarTheme: const AppBarTheme(backgroundColor: Colors.cyan),
    scaffoldBackgroundColor: Colors.white,
    hintColor: Colors.black,
    textTheme: const TextTheme(
      headline5: TextStyle(color: Colors.white),
      headline6: TextStyle(color: Colors.black),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(primary: Colors.black),
    ),
    brightness: Brightness.light,
    accentColor: Colors.black, // buttons color + scroll effect color
    primaryColor: Colors.black, // appbar + textfield length
    buttonColor: Colors.black,
    dialogBackgroundColor: Colors.black);
