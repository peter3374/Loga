import 'package:flutter/material.dart';

class OptionsButton extends StatelessWidget {
  final VoidCallback? onclick;
  final IconData? leadingIcon;
  final Color? color;
  final String? title;

  OptionsButton({
    Key? key,
    this.onclick,
    this.leadingIcon,
    this.title,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                InkWell(
                  onTap: onclick,
                  child: Icon(
                    leadingIcon,
                    color: Theme.of(context).primaryColor,
                    size: 30,
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).primaryColor,
                  spreadRadius: 0.6,
                  blurRadius: 2,
                ),
              ],
            ),
          ),
          const SizedBox(height: 7.0),
          FittedBox(
            child: Text(
              title!,
              style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).textTheme.headline6!.color,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
