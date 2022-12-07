import 'package:flutter/material.dart';
import 'package:loga/screens/console_screen/controller/console_screen_controller.dart';
import 'package:loga/screens/console_screen/widgets/field_options_widget.dart';
import 'package:loga/screens/console_screen/widgets/options_buttons_widget.dart';
import 'package:loga/screens/console_screen/widgets/top_banner_widget.dart';
import 'package:loga/themes/theme_manager.dart';
import 'package:provider/provider.dart';

class BottomSheetWidget extends StatelessWidget {
  final ConsoleScreenController consoleController;
  final TextEditingController textEditingController;
  const BottomSheetWidget({
    Key? key,
    required this.consoleController,
    required this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        expand: true,
        initialChildSize: 0.14,
        minChildSize: 0.14,
        maxChildSize: 0.5,
        builder: (BuildContext context, ScrollController controller) {
          return Material(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(14),
              topRight: Radius.circular(14),
            ),
            // TODO error here
            color: context.watch<ThemeManager>().sheetColor,

            //
            child: SingleChildScrollView(
              // physics: PageScrollPhysics(),
              controller: controller,
              child: Column(
                children: [
                  TopBannerWidget(),
                  FieldOptionsWidget(
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
