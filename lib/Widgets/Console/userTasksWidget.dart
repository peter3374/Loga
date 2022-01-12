import 'package:flutter/material.dart';

class UserTasks extends StatelessWidget {
  double fontSize = 12;
  final String date, userName, text;

   UserTasks(
      {Key? key,
      required this.fontSize,
      required this.date,
      required this.text,
      required this.userName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.all(3.5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                border: Border.all(color: Theme.of(context).hintColor)),
            child: Text(
              date,
              style: TextStyle(
                  color: Theme.of(context).textTheme.headline6!.color),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'C:/$userName>',
                softWrap: true,
                maxLines: 3,
                style: TextStyle(
                    color: Theme.of(context).textTheme.headline6!.color,
                    fontSize: fontSize),
              ),
            ),
            Flexible(
              child: Text(
                text,
                overflow: TextOverflow.fade,
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Theme.of(context).textTheme.headline6!.color,
                    fontSize: fontSize),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class UserTasksFont extends StatelessWidget {
  final String date, userName, text;
  double fontSize = 12;
  UserTasksFont(
      {Key? key,
      required this.fontSize,
      required this.date,
      required this.text,
      required this.userName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.all(3.5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                border: Border.all(color: Theme.of(context).hintColor)),
            child: Text(
              date,
              style: TextStyle(
                  color: Theme.of(context).textTheme.headline6!.color),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'C:/$userName>',
                softWrap: true,
                maxLines: 3,
                style: TextStyle(
                    color: Theme.of(context).textTheme.headline6!.color,
                    fontSize: 15),
              ),
            ),
            Flexible(
              child: Text(
                text,
                overflow: TextOverflow.fade,
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Theme.of(context).textTheme.headline6!.color,
                    fontSize: fontSize),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
