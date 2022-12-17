import 'package:flutter/material.dart';

final darkGreenMode = ThemeData(
  useMaterial3: true,
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(color: Colors.white),
    color: Colors.green,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
    ),
  ),
  scaffoldBackgroundColor: Colors.black,
  hintColor: Colors.green,
  textTheme: const TextTheme(
    headline5: TextStyle(color: Colors.green),
    headline6: TextStyle(color: Colors.green),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(foregroundColor: Colors.green),
  ),
  primaryColor: Colors.green,
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.green,
  ),
  dialogBackgroundColor: Colors.green,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.green,
    ),
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.green),
);

final darkRedMode = ThemeData(
  useMaterial3: true,
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(color: Colors.white),
    color: Colors.red,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
    ),
  ),
  scaffoldBackgroundColor: Colors.black,
  hintColor: Colors.red,
  textTheme: const TextTheme(
    headline5: TextStyle(color: Colors.red),
    headline6: TextStyle(color: Colors.red),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(foregroundColor: Colors.pink),
  ),
  primaryColor: Colors.red,
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.red,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.red,
    ),
  ),
  dialogBackgroundColor: Colors.red,
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.red),
);

final darkOrangeMode = ThemeData(
  useMaterial3: true,
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(color: Colors.white),
    color: Colors.deepOrangeAccent,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
    ),
  ),
  scaffoldBackgroundColor: Colors.black,
  hintColor: Colors.deepOrangeAccent,
  textTheme: const TextTheme(
    headline5: TextStyle(color: Colors.deepOrangeAccent),
    headline6: TextStyle(color: Colors.deepOrangeAccent),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(foregroundColor: Colors.deepOrangeAccent),
  ),
  primaryColor: Colors.deepOrangeAccent, // appbar + textfield length
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.deepOrangeAccent,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.deepOrangeAccent,
    ),
  ),

  dialogBackgroundColor: Colors.deepOrangeAccent,
  colorScheme:
      ColorScheme.fromSwatch().copyWith(secondary: Colors.deepOrangeAccent),
);

final darkPinkMode = ThemeData(
  useMaterial3: true,
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(color: Colors.white),
    color: Colors.pink,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
    ),
  ),
  scaffoldBackgroundColor: Colors.black,
  hintColor: Colors.pink,
  textTheme: const TextTheme(
    headline5: TextStyle(color: Colors.pink),
    headline6: TextStyle(color: Colors.pink),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(foregroundColor: Colors.pink),
  ),
  primaryColor: Colors.white,
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.pink,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.pink,
    ),
  ),
  dialogBackgroundColor: Colors.pink,
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.pink),
);

final lightMode = ThemeData(
  useMaterial3: true,
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(color: Colors.white),
    color: Colors.cyan,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
    ),
  ),
  switchTheme: SwitchThemeData(
    thumbColor: MaterialStateProperty.all<Color>(Colors.black),
  ),
  scaffoldBackgroundColor: Colors.white,
  hintColor: Colors.black,
  textTheme: const TextTheme(
    headline5: TextStyle(color: Colors.white),
    headline6: TextStyle(color: Colors.black),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(foregroundColor: Colors.black),
  ),
  primaryColor: Colors.black,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
    ),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.white,
  ),
  dialogBackgroundColor: Colors.black,
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
);

final darkMode = ThemeData(
  useMaterial3: true,
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(color: Colors.white),
    color: Colors.black,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
    ),
  ),
  scaffoldBackgroundColor: Colors.black,
  hintColor: Colors.white,
  textTheme: TextTheme(
    headline5: TextStyle(color: Colors.white),
    headline6: TextStyle(color: Colors.white),
    subtitle1: TextStyle(color: Colors.white),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.black,
    ),
  ),
  primaryColor: Colors.white,
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.black,
  ),
  dialogBackgroundColor: Colors.white,
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
);
