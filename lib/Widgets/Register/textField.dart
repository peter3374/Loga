import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final int maxLength;
  final VoidCallback method;
  TextEditingController textEditingController;
  CustomTextField(
      {Key? key,
      required this.method,
      required this.hintText,
      required this.textEditingController,
      required this.maxLength})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
          onSubmitted: (value) {
            textEditingController.text = value;
          },
          controller: textEditingController,
          enableSuggestions: true, // hints on keyboard
          enableIMEPersonalizedLearning: true,
          enableInteractiveSelection: true,
          toolbarOptions: const ToolbarOptions(
              copy: true, cut: true, paste: true, selectAll: true),
          textInputAction: TextInputAction.go,
          keyboardType: TextInputType.text,
          maxLines: 1,
          maxLength: maxLength,
          cursorWidth: 8,
          cursorColor: Theme.of(context).primaryColor,
          style: Theme.of(context).textTheme.headline6,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(9),
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                )),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                ),
                borderRadius: BorderRadius.circular(9)),
            counterStyle: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
            hintText: hintText,
            hintStyle:
                TextStyle(color: Theme.of(context).primaryColor, fontSize: 18),
            border: InputBorder.none,
          )),
    );
  }
}
