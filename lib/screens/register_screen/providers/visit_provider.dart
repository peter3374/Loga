import 'package:hive_flutter/hive_flutter.dart';
import 'package:loga/database/scheme/db_scheme.dart';

class AuthProvider {
  static Future<bool> isUserRegistrated() async {
    if (Hive.box(DbScheme.userData).get(DbScheme.nickname) == null) {
      await Hive.box(DbScheme.userData).put(
        DbScheme.currentTheme,
        DbScheme.darkMode,
      );
      await Hive.box(DbScheme.userData).put(
        DbScheme.currentFontSize,
        12.0,
      );
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
