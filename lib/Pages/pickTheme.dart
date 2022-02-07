import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

import 'package:loda/Pages/themeVariables.dart';
import 'package:loda/Themes/theme_constants.dart';
import 'package:loda/Themes/theme_manager.dart';

import 'package:loda/Widgets/ChoseTheme/themeCard.dart';
import 'package:loda/Widgets/dialogs.dart';

import 'package:provider/src/provider.dart';

class SwitchThemePage extends StatefulWidget {
  @override
  _SwitchThemePageState createState() => _SwitchThemePageState();
}

// Save theme only if it paid; Toll themes can apply but save! Just for demo
class _SwitchThemePageState extends State<SwitchThemePage> {
  static List<String> _buttonTitles = [
    '0.99 USD',
    '0.99 USD',
    'Apply',
    '0.99 USD',
    'Apply',
    'Default'
  ];
  Box _hiveStorage = Hive.box('user_data');
  // Hive.box('user_data').name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 70,
          centerTitle: true,
          title: Text('Themes'.tr()),
          flexibleSpace: Container(
            width: double.infinity,
            height: 70,
            decoration: BoxDecoration(
                color: Theme.of(context).appBarTheme.backgroundColor,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12))),
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: ListView.builder(
            itemCount: _buttonTitles.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(30.0),
                child: MyThemeCard(
                  method: () {
                    // int selected = index;
                    switch (index) {
                      case 0:
                        CustomDialogsCollection.showCustomSnackBar('Demo');
                        print('green');
                        context
                            .read<ThemeManager>()
                            .setThemeData(darkGreenMode);

                        // sheet
                        context.read<ThemeManager>().sheetColor =
                            Color(0xFF001414);

                        break;
                      case 1:
                        CustomDialogsCollection.showCustomSnackBar('Demo');
                        print('red');
                        context.read<ThemeManager>().setThemeData(darkRedMode);
                        // sheet
                        context.read<ThemeManager>().sheetColor =
                            Color(0xFF140202);
                        // save
                        // _hiveStorage.put('currentTheme', 'darkRedMode');
                        break;
                      case 2:
                        print('fruit');
                        context
                            .read<ThemeManager>()
                            .setThemeData(darkOrangeMode);
                        // sheet
                        context.read<ThemeManager>().sheetColor =
                            Color(0xFF532809);
                        // save
                        _hiveStorage.put('currentTheme', 'darkOrangeMode');

                        break;
                      case 3:
                        CustomDialogsCollection.showCustomSnackBar('Demo');

                        context.read<ThemeManager>().setThemeData(darkPinkMode);
                        // sheet
                        context.read<ThemeManager>().sheetColor =
                            Color(0xFF33021D);

                        print('pink');
                        //save theme
                        //  _hiveStorage.put('currentTheme', 'darkPinkMode');
                        break;
                      case 4:
                        print('power light');
                        context.read<ThemeManager>().setThemeData(lightMode);
                        // sheet
                        context.read<ThemeManager>().sheetColor =
                            Color(0xFF06BFBF);
                        //save theme
                        _hiveStorage.put('currentTheme', 'lightMode');
                        break;

                      case 5:
                        print('Dark mode');
                        context.read<ThemeManager>().setThemeData(darkMode);
                        // sheet
                        context.read<ThemeManager>().sheetColor = Colors.black;
                        _hiveStorage.put('currentTheme', 'darkMode');
                        break;
                    }
                  },
                  buttonTitle: _buttonTitles[index],
                  shimmerBase: ThemeVariables.shimmerBase[index],
                  shimmerHightlight: ThemeVariables.shimmerHightlight[index],
                  color1: ThemeVariables.firstColors[index],
                  color2: ThemeVariables.secondColors[index],
                  color3: ThemeVariables.thirdColors[index],
                  imgCodeName: ThemeVariables.imgCodeName[index],
                  title: ThemeVariables.titles[index],
                ),
              );
            }));
  }
}
