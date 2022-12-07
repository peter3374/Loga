import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class TopBannerWidget extends StatelessWidget {
  const TopBannerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 155,
            vertical: 9,
          ),
          child: Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        Text(
          'Today'.tr() + ' ${DateFormat('MM/dd/yyyy').format(DateTime.now())}',
          maxLines: 1,
          style: TextStyle(
            color: Theme.of(context).textTheme.headline6!.color,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
