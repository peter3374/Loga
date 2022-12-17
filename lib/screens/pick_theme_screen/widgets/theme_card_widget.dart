import 'package:flutter/material.dart';
import 'package:loga/screens/pick_theme_screen/widgets/color_text_widget.dart';
import 'package:shimmer/shimmer.dart';

class ThemeCardWidget extends StatelessWidget {
  final VoidCallback? method;
  final Color shimmerBase;
  final Color shimmerHightlight;
  final Color mainColor;
  final Color backgroundColor;
  final String buttonTitle;
  final String title;
  final String imgCodeName;
  const ThemeCardWidget({
    Key? key,
    required this.buttonTitle,
    @required this.method,
    required this.mainColor,
    required this.backgroundColor,
    required this.title,
    required this.imgCodeName,
    required this.shimmerHightlight,
    required this.shimmerBase,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Shimmer.fromColors(
              baseColor: shimmerBase,
              highlightColor: shimmerHightlight,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 23.0,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: LimitedBox(
                  child: Image.asset('assets/themes_example/$imgCodeName.png'),
                  maxWidth: 160,
                  maxHeight: 200,
                ),
              ),
              Wrap(
                direction: Axis.vertical,
                children: [
                  ColorTextWidget(
                    shapeColor: mainColor,
                    text: 'Main color',
                  ),
                  ColorTextWidget(
                    shapeColor: backgroundColor,
                    text: 'Background color',
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 70),
                    child: ElevatedButton(
                      onPressed: method,
                      child: Text(
                        buttonTitle,
                        style: TextStyle(
                          color: Theme.of(context).appBarTheme.iconTheme?.color,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
