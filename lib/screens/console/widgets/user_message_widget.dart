import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserMessageWidget extends StatelessWidget {
  final double fontSize;
  final DateTime date;
  final String userName;
  final String text;

  UserMessageWidget({
    Key? key,
    this.fontSize = 12,
    required this.date,
    required this.text,
    required this.userName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Text(
            DateFormat.yMd().add_jm().format(date),
            style:
                TextStyle(color: Theme.of(context).textTheme.headline6!.color),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                '$userName>',
                softWrap: true,
                //   maxLines: 3,
                style: TextStyle(
                  color: Theme.of(context).textTheme.headline6!.color,
                  fontSize: fontSize,
                ),
              ),
            ),
            Flexible(
              child: Text(
                text,
                overflow: TextOverflow.fade,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Theme.of(context).textTheme.headline6!.color,
                  fontSize: fontSize,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
