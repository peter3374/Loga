import 'package:flutter/material.dart';

import 'package:hive/hive.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:loga/database/scheme/db_scheme.dart';
import 'package:loga/screens/erase_data_screen/widgets/remove_card.dart';

class EraseDataScreen extends StatefulWidget {
  const EraseDataScreen({Key? key}) : super(key: key);

  @override
  State<EraseDataScreen> createState() => _EraseDataScreenState();
}

class _EraseDataScreenState extends State<EraseDataScreen>
    with TickerProviderStateMixin {
  final _userDataStorage = Hive.box(DbScheme.userData);
  TextEditingController _passwordController = TextEditingController();
  bool isRemoveAllData = false,
      _isClicked2 = false,
      _isVisiblePassword = false,
      _applyValue = false;
  double _buttonOpacity = 0;
  double _fieldLeft = 900; // pixels? Bad idea
  String _errorHandler = '';

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _switchApplyValue(bool value) async {
    await Future.delayed(const Duration(milliseconds: 700));
    setState(() {
      _applyValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RemoveCard(
                text: "RemoveAll".tr(),
                isClicked: isRemoveAllData,
                method: () {
                  setState(() {
                    isRemoveAllData = !isRemoveAllData;
                    if (isRemoveAllData) {
                      _isClicked2 = false;
                      _fieldLeft = 0;
                      _buttonOpacity = 1;
                    } else {
                      _fieldLeft = 900;
                      _buttonOpacity = 0;
                      //  _passwordController.text = '';
                    }

                    //    Hive.deleteFromDisk();
                  });
                },
              ),
              RemoveCard(
                text: "RemoveDay".tr(),
                isClicked: _isClicked2,
                method: () {
                  //  Hive.deleteBoxFromDisk('user_reports');
                  setState(() {
                    _isClicked2 = !_isClicked2;
                    if (_isClicked2) {
                      isRemoveAllData = false;
                      _fieldLeft = 0;
                      _buttonOpacity = 1;
                    } else {
                      _fieldLeft = 900;
                      _buttonOpacity = 0;
                      //   _passwordController.text = '';
                    }
                  });
                },
              ),
            ],
          ),

          // text field

          AnimatedPadding(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInSine,
            padding: EdgeInsets.only(left: _fieldLeft),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: LimitedBox(
                maxWidth: 200,
                child: TextField(
                  obscureText: _isVisiblePassword, // show/hide
                  obscuringCharacter: '\$',
                  controller: _passwordController,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                  onEditingComplete: () {},
                  onSubmitted: (value) {
                    _passwordController.text = value;
                    // _buttonOpacity = 1;
                  },
                  //   onChanged: (value) =>    _passwordController.text = value,
                  cursorWidth: 8,
                  cursorColor: Theme.of(context).primaryColor,
                  decoration: InputDecoration(
                    icon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isVisiblePassword = !_isVisiblePassword;
                        });
                      },
                      child: Icon(
                        _isVisiblePassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    border: UnderlineInputBorder(),
                    prefixIconColor: Theme.of(context).primaryColor,
                    hintText: 'Password'.tr(),
                    hintStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                    focusColor: Theme.of(context).primaryColor,
                    hoverColor: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
          ),
          // button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: AnimatedOpacity(
                opacity: _buttonOpacity,
                duration: Duration(milliseconds: 300),
                child: Container(
                  width: 120,
                  height: 45,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Transform.scale(
                        scale: 1.2,
                        child: Checkbox(
                          checkColor: Colors.red,
                          fillColor:
                              MaterialStateProperty.all(Colors.transparent),
                          value: _applyValue,
                          onChanged: (bool? value) async {
                            if (_passwordController.text.compareTo(
                                    _userDataStorage.get(DbScheme.password)) ==
                                0) {
                              if (isRemoveAllData) {
                                _errorHandler = 'Removed!';
                                //  Hive.deleteFromDisk();
                              }
                              if (_isClicked2) {
                                // await Hive.deleteBoxFromDisk('user_reports')
                                //     .then((value) =>
                                _errorHandler = 'Removed, pls restart the app!';
                              }
                              _switchApplyValue(value!);
                              // Navigator.pop(context);
                            } else if (_passwordController.text == '') {
                              _errorHandler = 'Enter password';
                            } else {
                              _errorHandler = 'Wrong password';
                            }
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      Text(
                        _applyValue ? 'Removed'.tr() : 'Remove'.tr(),
                        style: TextStyle(
                            color:
                                Theme.of(context).textTheme.headline6!.color),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      width: 2,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Text(
              _errorHandler,
              style: TextStyle(color: Colors.red),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 120,
                  height: 45,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.arrow_back_ios_new,
                        color: Theme.of(context).primaryColor,
                        size: 30,
                      ),
                      Text(
                        'Back'.tr(),
                        style: TextStyle(
                          color: Theme.of(context).textTheme.headline6!.color,
                        ),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      width: 2,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
