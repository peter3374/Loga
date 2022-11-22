import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:loga/database/scheme/db_scheme.dart';

class ChangeFontController extends ChangeNotifier {
  double fontSize = 12;

  Future<void> changeFontSize() async =>
      await Hive.box(DbScheme.userData).put(DbScheme.currentFontSize, fontSize);
}
