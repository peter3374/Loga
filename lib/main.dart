import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:loga/database/todomodel.dart';
import 'package:loga/screens/console/console_screen.dart';
import 'package:loga/screens/register/register_screen.dart';
import 'package:loga/themes/theme_manager.dart';
import 'package:loga/model/controllers/ChangeFont/changeFontLogic.dart';
import 'package:loga/model/controllers/Console/speechLogic.dart';
import 'package:loga/model/controllers/Register/getVisits.dart';
import 'package:path_provider/path_provider.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Hive
  final appDocDir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocDir.path);
  Hive.registerAdapter(TodoModelAdapter());
  await Hive.openBox('user_data'); // some data like themes, password
  await Hive.openBox<TodoModel>('user_reports'); // only reports

// translae init
  await translator.init(
    localeType: LocalizationDefaultType.device,
    languagesList: <String>['en', 'ru', 'by', 'es', 'pl'],
    assetsDirectory: 'assets/locales/',
  );
  // prevent orientation
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    LocalizedApp(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ThemeManager()),
          ChangeNotifierProvider(
            create: (context) => ChangeFontLogic(),
          ),
          ChangeNotifierProvider(create: (context) => SpeechLogic())
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
        future: UserData.getUserVisits(),
        builder: (context, isFirstVisit) {
          return isFirstVisit.data == true ? RegisterScreen() : ConsoleScreen();
        },
      ),
    );
  }
}
