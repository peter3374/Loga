import 'package:flutter/material.dart';

class FontNavigationButton extends StatelessWidget {
  final VoidCallback? method;
  final IconData icon;
  FontNavigationButton({
    Key? key,
    required this.icon,
    required this.method,
  }) : super(key: key);

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
