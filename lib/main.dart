import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:loga/database/scheme/db_scheme.dart';
import 'package:loga/database/todomodel.dart';
import 'package:loga/screens/initial_screen/initial_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:localize_and_translate/localize_and_translate.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appDocDir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocDir.path);
  Hive.registerAdapter(TodoModelAdapter());
  await Hive.openBox(DbScheme.userData);
  await Hive.openBox<TodoModel>(DbScheme.userReports);

  await translator.init(
    localeType: LocalizationDefaultType.device,
    languagesList: <String>['en', 'ru', 'by', 'es', 'pl'],
    assetsDirectory: 'assets/locales/',
  );
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    LocalizedApp(
      child: MyHomePage(),
    ),
  );
}
