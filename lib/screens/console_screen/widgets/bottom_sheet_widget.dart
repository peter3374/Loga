import 'package:flutter/material.dart';
import 'package:loga/screens/console_screen/controller/console_screen_controller.dart';
import 'package:loga/screens/console_screen/widgets/field_options_widget.dart';
import 'package:loga/screens/console_screen/widgets/options_buttons_widget.dart';
import 'package:loga/screens/console_screen/widgets/top_banner_widget.dart';

class BottomSheetWidget extends StatelessWidget {
  final ConsoleScreenController consoleController;
  final TextEditingController textEditingController;
  final ScrollController scrollController;
  const BottomSheetWidget({
    Key? key,
    required this.consoleController,
    required this.textEditingController,
    required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        expand: true,
        initialChildSize: 0.090,
        minChildSize: 0.090,
        maxChildSize: 0.45,
        builder: (BuildContext context, ScrollController controller) {
          return Material(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(14),
              topRight: Radius.circular(14),
            ),
            color: Colors.black,
            child: SingleChildScrollView(
              physics: const PageScrollPhysics(),
              controller: controller,
              child: Column(
                children: [
                  TopBannerWidget(),
                  FieldOptionsWidget(
                    scrollController: scrollController,
                    consoleController: consoleController,
                    textEditingController: textEditingController,
                  ),
                  OptionsButtonWidget(),
                ],
              ),
            ),
          );
        });
  }
}
