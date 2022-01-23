import 'package:flutter/material.dart';

class RemoveCard extends StatelessWidget {
  final VoidCallback? method;
  final String text;
  bool isClicked = false;
  RemoveCard(
      {Key? key,
      required this.method,
      required this.isClicked,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: method,
        child: Container(
          width: 170, // for image - 170
          height: 200, // for image - 300
          child: Align(
            alignment: Alignment.center,
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 22,
                  color: Theme.of(context).textTheme.headline6!.color),
            ),
          ),
          // Image.asset(
          //   'assets/gifChose/meme.gif',
          //   fit: BoxFit.cover,
          // ),
          decoration: BoxDecoration(
              border: Border.all(
                  color:
                      isClicked ? Colors.red : Theme.of(context).primaryColor,
                  width: 4),
              borderRadius: BorderRadius.circular(19),
              color: Colors.black12),
        ),
      ),
    );
  }
}
