import 'package:flutter/material.dart';
import 'package:loda/Widgets/Locale/confirmButtonLocale.dart';
import 'package:loda/Widgets/Locale/pickLocaleButton.dart';

class LocalePage extends StatefulWidget {
  LocalePage({Key? key}) : super(key: key);

  @override
  State<LocalePage> createState() => _LocalePageState();
}

class _LocalePageState extends State<LocalePage> with TickerProviderStateMixin {
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
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      _buttonWidth = 100;
      _buttonHeight = 50;
    });
  }

  final List<String> _localeText = ['English', 'Русский', 'España'];
  final List<String> _countryCodes = [
    'united-states',
    'russia',
    'spain',
  ];
  int _opacity = 0;

  double _buttonWidth = 10;
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
                          _isClicked = !_isClicked;
                        });
                        print(index);
                      },
                      title: _localeText[index],
                      leadingIcon: Icons.local_restaurant,
                    );
                  }),
              Text(
                'Images by Flaticon.com',
                style: TextStyle(
                    color: Theme.of(context).textTheme.headline6!.color),
              ),
              // buttons

              ConfirmButtonLocale(
                text: 'Apply',
                height: _buttonHeight,
                width: _buttonWidth,
                method: () => Navigator.pop(context),
              ),
              ConfirmButtonLocale(
                text: 'Back',
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