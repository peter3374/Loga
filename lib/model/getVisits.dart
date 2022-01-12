import 'package:hive_flutter/hive_flutter.dart';

class UserData {
  static Future<bool> getUserVisits() async {
    Box hiveStorage = await Hive.box('user_data');
    if (hiveStorage.get('nickname') == null) {
      hiveStorage.put('currentTheme', 'darkMode'); // set default theme
      hiveStorage.put('currentFontSize', 12.0);
      print('first time');
      return true;
    } else {
      print('not first time');
      print('current font size: ${hiveStorage.get(
        'currentFontSize',
      )}');
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
