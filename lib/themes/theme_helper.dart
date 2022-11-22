import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:loga/database/scheme/db_scheme.dart';
import 'package:loga/themes/theme_constants.dart';

class ThemeHelper {
static final _userDataStorage =  Hive.box(DbScheme.userData);

  static ThemeData getCurrentTheme() {
    String _currentTheme =
      _userDataStorage .get(DbScheme.currentTheme) ?? 'darkMode';
    switch (_currentTheme) {
      case 'darkGreenMode':
        print(_currentTheme);
        return darkGreenMode;
      case 'darkRedMode':
        print(_currentTheme);
        return darkRedMode;
      case 'darkPinkMode':
        print(_currentTheme);
        return darkPinkMode;
      case 'darkOrangeMode':
        print(_currentTheme);
        return darkOrangeMode;
      case 'lightMode':
        print(_currentTheme);
        return lightMode;
      default:
        print(_currentTheme);
        return darkMode;
    }
  }

  static Color getBottomSheetColor() {
    String currentTheme = _userDataStorage.get(DbScheme.currentTheme) ?? 'null';
    switch (currentTheme) {
      case 'darkGreenMode':
        print(currentTheme);
        return Color(0xFF001414);
      case 'darkRedMode':
        print(currentTheme);
        return Color(0xFF140202);
      case 'darkPinkMode':
        print(currentTheme);
        return Color(0xFF33021D);
      case 'darkOrangeMode':
        print(currentTheme);
        return Color(0xFF532809);
      case 'lightMode':
        print(currentTheme);
        return Color(0xFF00FFFF);
      default:
        print(currentTheme);
        return Color(0xFF000000);
    }
  }
}