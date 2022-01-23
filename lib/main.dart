import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loda/Pages/consolePage.dart';
import 'package:loda/Pages/locale.dart';
import 'package:loda/Pages/register.dart';
import 'package:loda/Themes/theme_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:loda/model/Logic/Register/getVisits.dart';
import 'package:loda/model/database/todomodel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocDir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocDir.path);
  Hive.registerAdapter(TodoModelAdapter());
  await Hive.openBox('user_data'); // some data like themes, password
  await Hive.openBox<TodoModel>('user_reports'); // only reports
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => ThemeManager())],
      child: const MaterialAppTheme(),
    ),
  );
}

class MaterialAppTheme extends StatelessWidget {
  const MaterialAppTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Loga',
        theme: Provider.of<ThemeManager>(context).getThemeData,
        home:
        // LocalePage()

            FutureBuilder(
          future: UserData.getUserVisits(),
          builder: (context, snapshot) {
            if (snapshot.data == true) {
              return Register();
            } else {
              return ConsolePage();
            }
          },
        )
        );
  }
}
