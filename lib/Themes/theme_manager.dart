import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:loga/themes/theme_constants.dart';

class ThemeManager with ChangeNotifier {
  // default is dark mode
  ThemeData? themeData = ThemeHelper.getCurrentTheme();
  get getThemeData => themeData;

  Color sheetColor = ThemeHelper.getSheetColor();

  void setThemeData(ThemeData data) {
    themeData = data;
    var res = ThemeHelper.getSheetColor();
    print(res);
    print(res.runtimeType);
    notifyListeners();
  }

  // void toggleTheme(int  index) {
  //   _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
  //   notifyListeners();
  // }
}

class ThemeHelper {
  static ThemeData getCurrentTheme() {
    String currentTheme =
        Hive.box('user_data').get('currentTheme') ?? 'darkMode';
    switch (currentTheme) {
      case 'darkGreenMode':
        print(currentTheme);
        return darkGreenMode;
      case 'darkRedMode':
        print(currentTheme);
        return darkRedMode;
      case 'darkPinkMode':
        print(currentTheme);
        return darkPinkMode;
      case 'darkOrangeMode':
        print(currentTheme);
        return darkOrangeMode;
      case 'lightMode':
        print(currentTheme);
        return lightMode;
      default:
        print(currentTheme);
        return darkMode;
    }
  }

  static Color getSheetColor() {
    String currentTheme = Hive.box('user_data').get('currentTheme') ?? 'null';
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
