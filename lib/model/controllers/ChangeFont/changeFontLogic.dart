import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ChangeFontLogic extends ChangeNotifier {
  double fontSize = 12;

  changeFontSize() {
    Hive.box('user_data').put('currentFontSize', fontSize);
    notifyListeners();
  }
}
