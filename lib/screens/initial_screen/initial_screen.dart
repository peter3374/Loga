import 'package:flutter/material.dart';
import 'package:loga/screens/change_font_screen/controller/change_font_controller.dart';
import 'package:loga/screens/console_screen/console_screen.dart';
import 'package:loga/screens/console_screen/controller/console_screen_controller.dart';
import 'package:loga/screens/console_screen/providers/speech_provider.dart';
import 'package:loga/screens/register_screen/controller/register_controller.dart';
import 'package:loga/screens/register_screen/providers/nicknames_generator_provider.dart';
import 'package:loga/screens/register_screen/providers/password_generator_provider.dart';
import 'package:loga/screens/register_screen/providers/register_form_validation_provider.dart';
import 'package:loga/screens/register_screen/providers/visit_provider.dart';
import 'package:loga/screens/register_screen/register_screen.dart';
import 'package:loga/themes_manager/theme_manager.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ChangeFontController(),
        ),
        ChangeNotifierProvider(create: (context) => SpeechProvider()),
        ChangeNotifierProvider(create: (context) => ConsoleScreenController()),
        ChangeNotifierProvider(
          create: (context) => RegisterScreenController(
            nicknameGeneratorProvider: NicknamesGeneratorProvider(),
            passwordGeneratorProvider: PasswordGeneratorProvider(),
            registerFormValidationProvider: RegisterFormValidationProvider(),
          ),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (__, ThemeProvider themeProvider, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Loga',
          theme: themeProvider.currentTheme,
          home: FutureBuilder(
            future: AuthProvider.isUserRegistrated(),
            builder: (_, isUserRegistrated) {
              return isUserRegistrated.data == true
                  ? RegisterScreen()
                  : ConsoleScreen();
            },
          ),
        ),
      ),
    );
  }
}
