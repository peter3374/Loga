import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:loga/common_widgets/dialogs.dart';
import 'package:loga/database/scheme/db_scheme.dart';
import 'package:loga/screens/pick_theme_screen/widgets/theme_card_widget.dart';
import 'package:loga/themes_manager/theme_constants.dart';
import 'package:loga/themes_manager/theme_manager.dart';
import 'package:loga/themes_manager/theme_constants_provider.dart';
import 'package:provider/src/provider.dart';

class PickThemeScreen extends StatefulWidget {
  @override
  _PickThemeScreenState createState() => _PickThemeScreenState();
}

class _PickThemeScreenState extends State<PickThemeScreen> {
  static List<String> _buttonTitles = [
    '1.99 USD',
    '1.99 USD',
    'Apply',
    '1.29 USD',
    'Free',
    'Free',
  ];
  final _userDataStorage = Hive.box(DbScheme.userData);

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 60,
        centerTitle: true,
        title: Text('Themes'.tr()),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).appBarTheme.iconTheme?.color,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        flexibleSpace: Container(
          width: double.infinity,
          height: 70,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
          ),
        ),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: ListView.builder(
          itemCount: _buttonTitles.length,
          itemBuilder: (context, i) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ThemeCardWidget(
                method: () async {
                  switch (i) {
                    case 0:
                      CustomDialogsCollection.displaySnackbar(
                        message: 'Demo',
                        context: context,
                      );
                      print('green');
                      themeManager.setThemeData(darkGreenMode);

                      break;
                    case 1:
                      CustomDialogsCollection.displaySnackbar(
                        message: 'Demo',
                        context: context,
                      );

                      context.read<ThemeProvider>().setThemeData(darkRedMode);

                      // save
                      // _hiveStorage.put('currentTheme', 'darkRedMode');
                      break;
                    case 2:
                      context
                          .read<ThemeProvider>()
                          .setThemeData(darkOrangeMode);

                      await _userDataStorage.put(
                          DbScheme.currentTheme, darkOrangeMode);

                      break;
                    case 3:
                      CustomDialogsCollection.displaySnackbar(
                        message: 'Demo',
                        context: context,
                      );

                      context.read<ThemeProvider>().setThemeData(darkPinkMode);

                      //save theme
                      //  await    _userDataStorage.put('currentTheme', 'darkPinkMode');
                      break;
                    case 4:
                      context.read<ThemeProvider>().setThemeData(yellowMode);

                      // await _userDataStorage.put(
                      //     DbScheme.currentTheme, DbScheme.darkMode);
                      break;
                    case 5:
                      context.read<ThemeProvider>().setThemeData(darkMode);

                      await _userDataStorage.put(
                          DbScheme.currentTheme, DbScheme.darkMode);
                      break;
                  }
                },
                buttonTitle: _buttonTitles[i],
                shimmerBase: ThemeConstantsProvider.shimmerBase[i],
                shimmerHightlight: ThemeConstantsProvider.shimmerHightlight[i],
                mainColor: ThemeConstantsProvider.primaryColor[i],
                backgroundColor: Colors.black,
                imgCodeName: ThemeConstantsProvider.imgCodeName[i],
                title: ThemeConstantsProvider.themeTitles[i],
              ),
            );
          }),
    );
  }
}
