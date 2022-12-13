import 'package:flutter/material.dart';

// pay
ThemeData darkGreenMode = ThemeData(
  useMaterial3: true,
  appBarTheme: const AppBarTheme(backgroundColor: Colors.green),
  scaffoldBackgroundColor: Colors.black,
  hintColor: Colors.green,
  textTheme: const TextTheme(
    headline5: TextStyle(color: Colors.green),
    headline6: TextStyle(color: Colors.green),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(foregroundColor: Colors.green),
  ),
  primaryColor: Colors.green, // appbar + textfield length
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
// pay
ThemeData darkRedMode = ThemeData(
  useMaterial3: true,
  appBarTheme: const AppBarTheme(backgroundColor: Colors.red),
  scaffoldBackgroundColor: Colors.black,
  hintColor: Colors.red,
  textTheme: const TextTheme(
    headline5: TextStyle(color: Colors.red),
    headline6: TextStyle(color: Colors.red),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(primary: Colors.red),
  ),
  primaryColor: Colors.red, // appbar + textfield length

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

// pay
ThemeData darkPinkMode = ThemeData(
  useMaterial3: true,
  appBarTheme: const AppBarTheme(backgroundColor: Colors.pink),
  scaffoldBackgroundColor: Colors.black,
  hintColor: Colors.pink,
  textTheme: const TextTheme(
    headline5: TextStyle(color: Colors.pink),
    headline6: TextStyle(color: Colors.pink),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(foregroundColor: Colors.pink),
  ),
  primaryColor: Colors.pink, // appbar + textfield length

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

ThemeData darkOrangeMode = ThemeData(
  useMaterial3: true,
  appBarTheme: const AppBarTheme(backgroundColor: Colors.deepOrangeAccent),
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

// middle day default theme

// TODO stable
ThemeData darkMode = ThemeData(
  useMaterial3: true,
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(color: Colors.red),
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

// power light
ThemeData lightMode = ThemeData(
  useMaterial3: true,
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
    style: TextButton.styleFrom(foregroundColor: Colors.black),
  ),
  primaryColor: Colors.black, // appbar + textfield length

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
