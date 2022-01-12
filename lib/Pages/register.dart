import 'dart:math';
import 'dart:ui';

import 'package:loda/Pages/consolePage.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:loda/Widgets/Register/textField.dart';
import 'package:loda/main.dart';
import 'package:loda/model/auth.dart';
import 'package:loda/model/database/todomodel.dart';
import 'package:parallax_rain/parallax_rain.dart';
import 'package:random_string/random_string.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String _errorhandler = '';
  final _formKey = GlobalKey<FormState>();

  TextEditingController _nicknameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _nicknameStatus = false;
  bool _passwordStatus = false;

  String verification() {
    if (_formKey.currentState!.validate()) {
      if (_nicknameController.text.length > 3 &&
          _passwordController.text.length >= 8) {
        Box username_box = Hive.box('user_data');
        username_box.put('nickname', _nicknameController.text);
        username_box.put('password', _passwordController.text);
        print('Username: ${_nicknameController.text}');
        print('Password: ${_passwordController.text}');
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ConsolePage()),
        );
        return 'Saved data!';
      } else if (_nicknameController.text == '' &&
          _passwordController.text == '') {
        return 'Fields cant be empty.';
      } else if (_nicknameController.text == '') {
        return 'Nickname cant be empty.';
      } else if (_passwordController.text == '') {
        return 'Password cant be empty.';
      } else if (_nicknameController.text.length <= 2) {
        return 'Too short nickname. Nickname must be >2 symbols.';
        print(_errorhandler);
      } else if (_passwordController.text.length <= 8) {
        return 'Too short password. Password must be >10 symbols.';
      }
    }
    return '.';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: ParallaxRain(
          dropFallSpeed: 1.60,
          dropHeight: 10,
          numberOfDrops: 300,
          dropColors: const [
            Colors.green,
            Colors.greenAccent,
          ],
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  logo(),
                  CustomTextField(
                    method: null,
                    hintText: 'Nickname:',
                    textEditingController: _nicknameController,
                    maxLength: 20,
                  ),
                  CustomTextField(
                    method: null,
                    hintText: 'Password:',
                    textEditingController: _passwordController,
                    maxLength: 20,
                  ),
                  Text(
                    _errorhandler,
                    style: TextStyle(color: Colors.red),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Generate nickname',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      CupertinoSwitch(
                        thumbColor: Theme.of(context).scaffoldBackgroundColor,
                        value: _nicknameStatus,
                        onChanged: (value) {
                          setState(() {
                            _nicknameStatus = value;
                            if (_nicknameStatus) {
                              _nicknameController.text = Auth.nickNames[
                                  Random().nextInt(Auth.nickNames.length)];
                            } else {
                              _nicknameController.text = '';
                            }
                          });
                        },
                        activeColor: Colors.white,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Generate password',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      CupertinoSwitch(
                        value: _passwordStatus,
                        onChanged: (value) {
                          setState(() {
                            _passwordStatus = value;
                            if (_passwordStatus) {
                              _passwordController.text =
                                  randomString(8);
                            } else {
                              _passwordController.text = '';
                            }
                          });
                        },
                        thumbColor: Theme.of(context).scaffoldBackgroundColor,
                        activeColor: Colors.white,
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _errorhandler = verification();
                      });
                    },
                    child: const Text(
                      'Enter',
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // decoration: BoxDecoration(
          //     image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(''))),
        ),
      ),
    );
  }
}

Widget logo() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 50),
    child: Column(
      children: [
        Image.asset('assets/logo.png'),
        const Text(
          'Your awesome\n        day logger',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ],
    ),
  );
}
