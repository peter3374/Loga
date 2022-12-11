import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:loga/database/scheme/db_scheme.dart';
import 'package:loga/screens/console_screen/console_screen.dart';
import 'package:loga/screens/register_screen/providers/nicknames_generator_provider.dart';
import 'package:loga/screens/register_screen/providers/password_generator_provider.dart';
import 'package:loga/screens/register_screen/providers/register_form_validation_provider.dart';

class RegisterScreenController extends ChangeNotifier {
  bool isRandomNickname = false;
  bool isRandomPassword = false;
  final _userDataStorage = Hive.box(DbScheme.userData);
  final NicknamesGeneratorProvider _nicknameGeneratorProvider;
  final PasswordGeneratorProvider _passwordGeneratorProvider;
  final RegisterFormValidationProvider registerFormValidationProvider;
  RegisterScreenController({
    required NicknamesGeneratorProvider nicknameGeneratorProvider,
    required PasswordGeneratorProvider passwordGeneratorProvider,
    required this.registerFormValidationProvider,
  })  : _nicknameGeneratorProvider = nicknameGeneratorProvider,
        _passwordGeneratorProvider = passwordGeneratorProvider;

  String generateNickname() =>
      isRandomNickname ? _nicknameGeneratorProvider.getRandomNickname() : '';

  void switchNicknameValue(bool newValue) {
    isRandomNickname = newValue;
    notifyListeners();
  }

  String generatePassword() =>
      isRandomPassword ? _passwordGeneratorProvider.generatePassword() : '';

  void switchPasswordValue(bool newValue) {
    isRandomPassword = newValue;
    notifyListeners();
  }

  bool _isValidForm({required GlobalKey<FormState> formKey}) =>
      formKey.currentState!.validate() ? true : false;

  Future<void> signUp({
    required GlobalKey<FormState> formKey,
    required BuildContext context,
    required String nickname,
    required String password,
  }) async =>
      _isValidForm(formKey: formKey)
          ? await Future.wait([
              _userDataStorage.put(DbScheme.nickname, nickname),
              _userDataStorage.put(DbScheme.password, password),
              _userDataStorage.put(DbScheme.createdAt, DateTime.now()),
            ]).then(
              (value) => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ConsoleScreen()),
              ),
            )
          : null;
}
