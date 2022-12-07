import 'dart:developer';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:loga/database/scheme/db_scheme.dart';

class VisitProvider {
  static Future<bool> getUserVisits() async {
    if (Hive.box(DbScheme.userData).get(DbScheme.nickname) == null) {
      await Hive.box(DbScheme.userData)
          .put(DbScheme.currentTheme, DbScheme.darkMode); // set default theme
      await Hive.box(DbScheme.userData)
          .put(DbScheme.currentFontSize, 12.0); // set default font
      log('First Visit');
      return true;
    } else {
      return false;
    }
  }

  // static Future<bool> saveTheme(String theme) async {
  //   Box hiveStorage = await Hive.box('user_data');

  //   if (hiveStorage.get('current_theme') == null) {
  //     hiveStorage.put('isFirstTime', 'darkMode');
  //     print('default dark mode');
  //     return true;
  //   } else {
  //     hiveStorage.put('isFirstTime', theme);
  //     print('not first time');
  //     return false;
  //   }
  // }
}
