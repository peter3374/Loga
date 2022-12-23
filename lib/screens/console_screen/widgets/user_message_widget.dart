import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:timeago/timeago.dart' as timeago;

class UserMessageWidget extends StatelessWidget {
  final double fontSize;
  final DateTime createdAt;
  final String userName;
  final String text;

  UserMessageWidget({
    Key? key,
    this.fontSize = 12,
    required this.createdAt,
    required this.text,
    required this.userName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              userName,
              softWrap: true,
              //   maxLines: 3,
              style: TextStyle(
                color: Theme.of(context).textTheme.headline6!.color,
                fontSize: fontSize,
              ),
            ),
          ),
          SelectableText(
            text,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Theme.of(context).textTheme.headline6!.color,
              fontSize: fontSize,
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Text(
              timeago.format(createdAt, locale: translator.currentLanguage),
              style: TextStyle(
                color: Theme.of(context).textTheme.headline6!.color,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
