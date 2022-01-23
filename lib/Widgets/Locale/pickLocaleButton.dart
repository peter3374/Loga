import 'package:flutter/material.dart';

class PickLocaleButton extends StatelessWidget {
  final VoidCallback? onclick;
  final IconData leadingIcon;
  final String? title, countryCode;

  PickLocaleButton({
    Key? key,
    this.onclick,
    required this.leadingIcon,
    required this.countryCode,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: InkWell(
        onTap: onclick,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/flags/$countryCode.png',
                width: 40,
                height: 40,
              ),
              // Icon(
              //   leadingIcon,
              //   color: Theme.of(context).primaryColor,
              //   size: 35,
              // ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  title ?? 'null',
                  style: TextStyle(
                      fontSize: 25,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w300),
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Theme.of(context).primaryColor, width: 2),
          ),
        ),
      ),
    );
  }
}
