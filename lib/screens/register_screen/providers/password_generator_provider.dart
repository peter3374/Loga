import 'package:random_string/random_string.dart';

class PasswordGeneratorProvider {
  String generatePassword() => randomString(8);
}
