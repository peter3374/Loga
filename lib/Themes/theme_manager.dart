import 'package:flutter/material.dart';
import 'package:loga/themes/theme_helper.dart';

class ThemeManager extends ChangeNotifier {
  // default is dark mode
  ThemeData? themeData = ThemeHelper.getCurrentTheme();
  get getThemeData => themeData;

  Color sheetColor = ThemeHelper.getBottomSheetColor();

  void setThemeData(ThemeData data) {
    themeData = data;
    final res = ThemeHelper.getBottomSheetColor();
    print(res);
    print(res.runtimeType);
    notifyListeners();
  }

  // void toggleTheme(int  index) {
  //   _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
  //   notifyListeners();
  // }
}


