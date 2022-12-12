import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:loga/database/scheme/db_scheme.dart';
import 'package:loga/themes_manager/theme_constants.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData? currentTheme = getCurrentTheme();

  void setThemeData(ThemeData data) {
    currentTheme = data;

    notifyListeners();
  }

  static final _userDataStorage = Hive.box(DbScheme.userData);

  static ThemeData getCurrentTheme() {
    String _currentTheme =
        _userDataStorage.get(DbScheme.currentTheme) ?? 'darkMode';
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

  // void toggleTheme(int  index) {
  //   _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
  //   notifyListeners();
  // }
}
