
import 'package:flutter/material.dart';

class CustomFontNavigationButton extends StatelessWidget {
  VoidCallback? method;
  IconData icon;
  CustomFontNavigationButton(
      {Key? key, required this.icon, required this.method})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: InkWell(
        onTap: method,
        child: Icon(
          icon,
          color: Theme.of(context).primaryColor,
          size: 40,
        ),
      ),
    );
  }
}
