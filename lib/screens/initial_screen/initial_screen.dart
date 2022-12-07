import 'package:flutter/material.dart';
import 'package:loga/screens/change_font_screen/controller/change_font_controller.dart';
import 'package:loga/screens/console_screen/console_screen.dart';
import 'package:loga/screens/console_screen/controller/console_screen_controller.dart';
import 'package:loga/screens/console_screen/providers/speech_provider.dart';
import 'package:loga/screens/register_screen/controller/visit_provider.dart';
import 'package:loga/screens/register_screen/register_screen.dart';
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
        ChangeNotifierProvider(create: (context) => SpeechProvider()),
        ChangeNotifierProvider(create: (context) => ConsoleScreenController()),
      ],
      child: Consumer<ThemeManager>(
        builder: (__, ThemeManager themeProvider, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Loga',
          theme: themeProvider.currentTheme,
          home: FutureBuilder(
            future: VisitProvider.getUserVisits(),
            builder: (_, isFirstVisit) {
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
