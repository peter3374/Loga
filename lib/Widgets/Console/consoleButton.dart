import 'package:flutter/material.dart';

class ConsoleButton extends StatelessWidget {
  final VoidCallback? onclick;
  final IconData? leadingIcon;
  final Color? color;
  final String? title;

  ConsoleButton(
      {Key? key,
      this.onclick,
      this.leadingIcon,
      this.title,
      this.color = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Column(
        children: [
          InkWell(
            splashColor: Theme.of(context).buttonColor,
            onTap: onclick,
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Icon(
                    leadingIcon,
                    color: Theme.of(context).buttonColor,
                    size: 30,
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          Text(
            title!,
            style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).textTheme.headline6!.color,
                fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }
}
