import 'package:flutter/material.dart';
import 'package:loga/screens/pick_theme_screen/widgets/color_text_widget.dart';
import 'package:shimmer/shimmer.dart';

class ThemeCardWdiget extends StatelessWidget {
  final VoidCallback? method;
  final shimmerBase,
      shimmerHightlight,
      mainColor,
      backgroundColor,
      bottomSheetColor,
      buttonTitle;

  final String title, imgCodeName;

  const ThemeCardWdiget({
    Key? key,
    required this.buttonTitle,
    @required this.method,
    required this.mainColor,
    required this.backgroundColor,
    required this.bottomSheetColor,
    required this.title,
    required this.imgCodeName,
    required this.shimmerHightlight,
    required this.shimmerBase,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF011D1F),
        borderRadius: BorderRadius.circular(8),
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
                  ColorTextWidget(
                    shapeColor: bottomSheetColor,
                    text: 'BottomSheet color',
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 70),
                    child: ElevatedButton(
                      onPressed: method,
                      child: Text(buttonTitle),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
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
