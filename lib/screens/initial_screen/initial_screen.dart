
import 'package:flutter/material.dart';
import 'package:loga/screens/change_font/controller/change_font_controller.dart';
import 'package:loga/screens/console/console_screen.dart';
import 'package:loga/screens/console/controller/speech_provider.dart';
import 'package:loga/screens/register/controller/visit_provider.dart';
import 'package:loga/screens/register/register_screen.dart';
import 'package:loga/themes/theme_manager.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeManager()),
        ChangeNotifierProvider(
          create: (context) => ChangeFontController(),
        ),
        ChangeNotifierProvider(create: (context) => SpeechProvider())
      ],
      child: Consumer<ThemeManager>(
        builder: (context, ThemeManager themeProvider, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Loga',
          theme: themeProvider.themeData,
          home: FutureBuilder(
            future: VisitProvider.getUserVisits(),
            builder: (context, isFirstVisit) {
              return isFirstVisit.data == true
                  ? RegisterScreen()
                  : ConsoleScreen();
            },
          ),
        ),
      ),
    );
  }
}
