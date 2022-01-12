import 'package:flutter/material.dart';

class SwitchFontButton extends StatelessWidget {
  double fontSize;
  VoidCallback? method;
  SwitchFontButton({Key? key, required this.method, required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            12,
          ),
          border: Border.all(color: Theme.of(context).primaryColor, width: 2.2),
        ),
        child: TextButton(
            onPressed: method,
            child: Text(
              '$fontSize',
              style: TextStyle(
                  fontSize: fontSize, color: Theme.of(context).primaryColor),
            )),
      ),
    );
  }
}
