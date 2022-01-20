import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:hive/hive.dart';
import 'dart:math' as math;

import 'package:loda/Widgets/RemoveData/removeCard.dart';

class RemoveData extends StatefulWidget {
  const RemoveData({Key? key}) : super(key: key);

  @override
  State<RemoveData> createState() => _RemoveDataState();
}

class _RemoveDataState extends State<RemoveData> with TickerProviderStateMixin {
  TextEditingController _passwordController = TextEditingController();

  bool _isClicked1 = false; // border1
  bool _isClicked2 = false; // border2
  bool _applyValue = false; // checkBox
  double _buttonOpacity = 0; 
  double _fieldLeft = 900; // pixels? Bad idea

  @override
  void initState() {
    super.initState();
    // print('${Hive.box('user_data').get('password')}');
  }

  Future<void> _switchApplyValue(bool value) async {
    await Future.delayed(const Duration(milliseconds: 400));
    setState(() {
      _applyValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black54,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RemoveCard(
                text: "Remove all data!",
                isClicked: _isClicked1,
                method: () {
                  setState(() {
                    _isClicked1 = !_isClicked1;
                    if (_isClicked1) {
                      _fieldLeft = 0;
                      _buttonOpacity = 1;
                    } else {
                      _fieldLeft = 900;
                      _buttonOpacity = 0;
                      _passwordController.text = '';
                    }
                  });
                },
              ),
              RemoveCard(
                text: "Remove day reports.",
                isClicked: _isClicked2,
                method: () {
                  setState(() {
                    _isClicked2 = !_isClicked2;
                    if (_isClicked2) {
                      _fieldLeft = 0;
                      _buttonOpacity = 1;
                    } else {
                      _fieldLeft = 900;
                      _buttonOpacity = 0;
                      _passwordController.text = '';
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
            child: LimitedBox(
              maxWidth: 200,
              child: TextField(
                controller: _passwordController,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
                onEditingComplete: () {},
                onSubmitted: (value) {
                  _passwordController.text = value;
                  _buttonOpacity = 1;
                },
                cursorWidth: 8,
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.lock,
                    color: Theme.of(context).primaryColor,
                  ),
                  border: UnderlineInputBorder(),
                  prefixIconColor: Theme.of(context).primaryColor,
                  hintText: 'Password:',
                  hintStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                  focusColor: Theme.of(context).primaryColor,
                  hoverColor: Theme.of(context).primaryColor,
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
                          fillColor: MaterialStateProperty.all(Colors.white),
                          value: _applyValue,
                          onChanged: (bool? value) async {
                            if (_isClicked1) {
                              if (_passwordController.text.compareTo(
                                      Hive.box('user_data').get('password')) ==
                                  0) {
                                _switchApplyValue(value!);
                                //  Hive.deleteFromDisk();
                                await Hive.deleteBoxFromDisk('user_reports')
                                    .then((value) =>
                                        print('removed restart the app!'));
                                Navigator.pop(context);
                              } else if (_passwordController.text == '') {
                                print('Enter password');
                              } else {
                                print('Wrong');
                              }
                            }
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                      Text(
                        _applyValue ? 'Removed' : 'Remove',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(width: 2, color: Colors.white)),
                ),
              ),
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
                        color: Colors.white,
                        size: 30,
                      ),
                      Text(
                        'Back',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(width: 2, color: Colors.white)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
