import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:loga/Widgets/Locale/confirmButtonLocale.dart';
import 'package:loga/Widgets/Locale/pickLocaleButton.dart';
import 'package:loga/Widgets/dialogs.dart';

class LocaleScreen extends StatefulWidget {
  LocaleScreen({Key? key}) : super(key: key);

  @override
  State<LocaleScreen> createState() => _LocaleScreenState();
}

class _LocaleScreenState extends State<LocaleScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool _isClicked = false;
  @override
  void initState() {
    super.initState();
    _animateButton();
// animation
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation =
        Tween<double>(begin: 0, end: 1.0).animate(_animationController);

    _animationController.forward(); // run animation
  }

  _animateButton() async {
    await Future.delayed(Duration(milliseconds: 600));
    setState(() {
      _buttonWidth = 100;
      _buttonHeight = 50;
    });
  }

  final List<String> _localeText = [
    'Беларуская мова',
    'English',
    'España',
    'Polski',
    'Русский',
  ];
  final List<String> _countryCodes = [
    'by',
    'en',
    'es',
    'pl',
    'ru',
  ];
  int _opacity = 0, clickedIndex = 0;

  double _buttonWidth = 5;
  double _buttonHeight = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ColoredBox(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Column(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: _localeText.length,
                  itemBuilder: (context, index) {
                    return PickLocaleButton(
                      countryCode: _countryCodes[index],
                      onclick: () {
                        setState(() {
                          clickedIndex = index;
                          _isClicked = !_isClicked;
                        });
                        print(clickedIndex);
                      },
                      title: _localeText[index],
                      leadingIcon: Icons.local_restaurant,
                    );
                  }),

              // buttons

              ConfirmButtonLocale(
                  text: 'Apply'.tr(),
                  height: _buttonHeight,
                  width: _buttonWidth,
                  method: () {
                    switch (clickedIndex) {
                      case 0:
                        translator.setNewLanguage(
                          context,
                          newLanguage: 'by',
                          remember: true,
                          restart: true,
                        );

                        break;
                      case 1:
                        translator.setNewLanguage(
                          context,
                          newLanguage: 'en',
                          remember: true,
                          restart: true,
                        );
                        // CustomDialogsCollection.showCustomSnackBar('Done.');
                        break;
                      case 2:
                        translator.setNewLanguage(
                          context,
                          newLanguage: 'es',
                          remember: true,
                          restart: true,
                        );
                        break;
                      case 3:
                        translator.setNewLanguage(
                          context,
                          newLanguage: 'pl',
                          remember: true,
                          restart: true,
                        );
                        break;
                      case 4:
                        translator.setNewLanguage(
                          context,
                          newLanguage: 'ru',
                          remember: true,
                          restart: true,
                        );

                        break;
                    }
                    Navigator.pop(context);
                  }),
              ConfirmButtonLocale(
                text: 'Back'.tr(),
                height: _buttonHeight,
                width: _buttonWidth,
                method: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

// circle like in gta 5
              // Container(
              //   decoration: BoxDecoration(
              //       shape: BoxShape.circle,
              //       border: Border.all(color: Colors.white, width: 3)),
              //   width: 300,
              //   height: 300,
              //   child: Stack(
              //     children: [
              //       Container(
              //         decoration: BoxDecoration(
              //             shape: BoxShape.circle,
              //             color: Colors.white,
              //             border: Border.all(color: Colors.white, width: 3)),
              //         width: 70,
              //         height: 70,
              //       ),
              //       Center(
              //         child: Container(
              //           decoration: BoxDecoration(
              //               shape: BoxShape.circle,
              //               border: Border.all(color: Colors.white, width: 3)),
              //           width: 130,
              //           height: 130,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),