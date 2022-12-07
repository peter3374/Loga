import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class ColorTextWidget extends StatelessWidget {
  final Color shapeColor;
  final String text;

  const ColorTextWidget({
    Key? key,
    required this.shapeColor,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: CircleAvatar(
              backgroundColor: shapeColor,
              radius: 15,
            ),
          ),
          Text(
            text.tr(),
            style:
                TextStyle(color: Theme.of(context).textTheme.headline5!.color),
          ),
        ],
      ),
    );
  }
}
