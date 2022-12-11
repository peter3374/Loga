import 'package:flutter/material.dart';
import 'package:loga/screens/register_screen/providers/register_form_validation_provider.dart';

class RegisterTextFieldWidget extends StatelessWidget {
  final RegisterFormValidationProvider formValidationProvider;
  final String hintText;
  final int maxTextLength;
  final TextEditingController textEditingController;
  final bool isNicknameValidation;
  RegisterTextFieldWidget({
    Key? key,
    required this.hintText,
    required this.textEditingController,
    required this.maxTextLength,
    required this.formValidationProvider,
    required this.isNicknameValidation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 5,
      ),
      child: TextFormField(
        validator: (value) => isNicknameValidation
            ? formValidationProvider.validateNickname(value)
            : formValidationProvider.validatePassword(value),
        controller: textEditingController,
        enableInteractiveSelection: true,
        toolbarOptions: const ToolbarOptions(
          copy: true,
          cut: true,
          paste: true,
          selectAll: true,
        ),
        textInputAction: TextInputAction.go,
        keyboardType: TextInputType.text,
        maxLines: 1,
        maxLength: maxTextLength,
        cursorWidth: 8,
        cursorColor: Theme.of(context).primaryColor,
        style: Theme.of(context).textTheme.headline6,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          counterStyle: TextStyle(
            color: Theme.of(context).primaryColor.withOpacity(0.8),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Theme.of(context).primaryColor.withOpacity(0.8),
            fontSize: 18,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
