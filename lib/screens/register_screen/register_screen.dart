import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loga/screens/register_screen/controller/register_controller.dart';
import 'package:loga/screens/register_screen/widgets/register_text_field_widget.dart';
import 'package:parallax_rain/parallax_rain.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _nicknameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    _nicknameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final registerController = Provider.of<RegisterScreenController>(context);
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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50),
                    child: Column(
                      children: [
                        Image.asset('assets/logo.png'),
                        const Text(
                          'Your awesome\nday logger',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                  RegisterTextFieldWidget(
                    hintText: 'Nickname'.tr(),
                    formValidationProvider:
                        registerController.registerFormValidationProvider,
                    isNicknameValidation: true,
                    textEditingController: _nicknameController,
                    maxTextLength: 20,
                  ),
                  RegisterTextFieldWidget(
                    hintText: 'Password'.tr(),
                    formValidationProvider:
                        registerController.registerFormValidationProvider,
                    isNicknameValidation: false,
                    textEditingController: _passwordController,
                    maxTextLength: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'GenerateNickname'.tr(),
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      CupertinoSwitch(
                        value: registerController.isRandomNickname,
                        onChanged: (value) {
                          registerController.switchNicknameValue(value);
                          _nicknameController.text =
                              registerController.generateNickname();
                        },
                        thumbColor: Theme.of(context).primaryColor,
                        trackColor: Colors.grey.withOpacity(0.3),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'GeneratePassword'.tr(),
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      CupertinoSwitch(
                        value: registerController.isRandomPassword,
                        onChanged: (value) {
                          registerController.switchPasswordValue(value);
                          _passwordController.text =
                              registerController.generatePassword();
                        },
                        thumbColor: Theme.of(context).primaryColor,
                        trackColor: Colors.grey.withOpacity(0.3),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () async => await registerController.signUp(
                      formKey: _formKey,
                      context: context,
                      nickname: _nicknameController.text,
                      password: _passwordController.text,
                    ),
                    child: Text(
                      'Enter'.tr(),
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
