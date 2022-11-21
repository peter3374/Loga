import 'package:flutter/material.dart';

class ConfirmButtonLocale extends StatelessWidget {
  final VoidCallback? method;
  final String text;
  final double height, width;
  const ConfirmButtonLocale({
    Key? key,
    this.method,
    required this.height,
    required this.width,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: method,
        child: AnimatedContainer(
          curve: Curves.bounceIn,
          //curve: Curves.elasticOut,

          width: width,
          height: height,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Theme.of(context).primaryColor,
              width: 2,
            ),
          ),
          duration: Duration(milliseconds: 1100),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: Theme.of(context).textTheme.headline6!.color,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
