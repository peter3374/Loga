import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:loga/screens/change_font_screen/change_font.dart';
import 'package:loga/screens/console_screen/widgets/options_button.dart';
import 'package:loga/screens/erase_data_screen/erase_data_screen.dart';
import 'package:loga/screens/locale_screen/locale_screen.dart';
import 'package:loga/screens/pick_theme_screen/pick_theme_screen.dart';
import 'package:loga/themes_manager/theme_manager.dart';
import 'package:provider/provider.dart';

class OptionsButtonWidget extends StatelessWidget {
  const OptionsButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Wrap(
        runSpacing: 25,
        spacing: 0,
        alignment: WrapAlignment.center,
        children: [
          OptionsButton(
            leadingIcon: Icons.supervised_user_circle,
            title: 'Profile',
            onclick: () => null,
          ),
          OptionsButton(
            leadingIcon: Icons.style,
            title: 'Themes'.tr(),
            onclick: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => PickThemeScreen(),
              ),
            ),
          ),
          OptionsButton(
            leadingIcon: Icons.format_size,
            title: 'FontSize'.tr(),
            onclick: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ChangeFontSizeScreen(),
              ),
            ),
          ),
          // CustomButton1(
          //   leadingIcon: Icons.timeline,
          //   title: 'Stats',
          //   onclick: () => null,
          // ),
          OptionsButton(
            leadingIcon: Icons.star,
            title: 'RateApp'.tr(),
            onclick: () => null,
          ),
          OptionsButton(
              leadingIcon: Icons.delete,
              title: 'EraseData'.tr(),
              onclick: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EraseDataScreen(),
                  ),
                );
              }),
          OptionsButton(
            leadingIcon: Icons.translate,
            title: 'Lang'.tr(),
            onclick: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => LocaleScreen(),
              ),
            ),
          ),
          OptionsButton(
            leadingIcon: Icons.power_settings_new,
            title: 'Exit'.tr(),
            onclick: () async => await SystemNavigator.pop(),
          ),
        ],
      ),
    );
  }
}
