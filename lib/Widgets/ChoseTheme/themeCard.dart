import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MyThemeCard extends StatelessWidget {
  final VoidCallback? method;
  final shimmerBase, shimmerHightlight, color1, color2, color3, buttonTitle;

  final String title, imgCodeName;

  const MyThemeCard({
    Key? key,
    required this.buttonTitle,
    @required this.method,
    required this.color1,
    required this.color2,
    required this.color3,
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
          borderRadius: BorderRadius.circular(8)),
      width: 350,
      height: 270,
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
                padding: const EdgeInsets.all(9.0),
                child: LimitedBox(
                  child: Image.asset('assets/themeExample/$imgCodeName.png'),
                  maxWidth: 160,
                  maxHeight: 200,
                ),
              ),
              Wrap(
                direction: Axis.vertical,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: CircleAvatar(
                            backgroundColor: color1,
                          ),
                        ),
                        Text(
                          'Color',
                          style: TextStyle(
                              fontSize: 21,
                              color:
                                  Theme.of(context).textTheme.headline5!.color),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: CircleAvatar(
                            backgroundColor: color2,
                          ),
                        ),
                        Text(
                          'Background',
                          style: TextStyle(
                              fontSize: 21,
                              color:
                                  Theme.of(context).textTheme.headline5!.color),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: CircleAvatar(
                            backgroundColor: color3,
                          ),
                        ),
                        Text(
                          'Bottom sheet',
                          style: TextStyle(
                              fontSize: 21,
                              color:
                                  Theme.of(context).textTheme.headline5!.color),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 70),
                    child: ElevatedButton(
                      onPressed: method,
                      child: Text(buttonTitle),
                      style: ElevatedButton.styleFrom(primary: Colors.green),
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
