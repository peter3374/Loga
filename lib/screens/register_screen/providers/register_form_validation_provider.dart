// TODO translate
class RegisterFormValidationProvider {
  String? validateNickname(String? nickname) {
    if (nickname == null) {
      return 'Nickname cant be empty.';
    } else if (nickname.length <= 2) {
      return 'Too short nickname. Nickname must have at least 2 symbols.';
    } else {
      return null;
    }
  }

  String? validatePassword(String? password) {
    if (password == null) {
      return 'Password cant be empty.';
    } else if (password.length <= 2) {
      return 'Too short password. Password must have at least 8 symbols.';
    } else {
      return null;
    }
  }
}
