import 'package:hive_flutter/hive_flutter.dart';

class UserData {
  static Future<bool> getUserVisits() async {
    if (Hive.box('user_data').get('nickname') == null) {
      Hive.box('user_data')
          .put('currentTheme', 'darkMode'); // set default theme
      Hive.box('user_data').put('currentFontSize', 12.0); // set default font
      print('first time');
      return true;
    } else {
      print('not first time');
      print('current font size: ${Hive.box('user_data').get(
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
