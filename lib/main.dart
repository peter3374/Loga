import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:loga/database/scheme/db_scheme.dart';
import 'package:loga/database/todomodel.dart';
import 'package:loga/screens/console/console_screen.dart';
import 'package:loga/screens/register/register_screen.dart';
import 'package:loga/themes/theme_manager.dart';
import 'package:loga/screens/change_font/controller/change_font_controller.dart';
import 'package:loga/screens/console/controller/speech_provider.dart';
import 'package:loga/screens/register/controller/first_visit_provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';

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
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ThemeManager()),
          ChangeNotifierProvider(
            create: (context) => ChangeFontController(),
          ),
          ChangeNotifierProvider(create: (context) => SpeechProvider())
        ],
        child: const MaterialAppTheme(),
      ),
    ),
  );
}

class MaterialAppTheme extends StatelessWidget {
  const MaterialAppTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Loga',
      theme: Provider.of<ThemeManager>(context).getThemeData,
      home: FutureBuilder(
        future: FirstVisitProvider.getUserVisits(),
        builder: (context, isFirstVisit) {
          return isFirstVisit.data == true ? RegisterScreen() : ConsoleScreen();
        },
      ),
    );
  }
}
