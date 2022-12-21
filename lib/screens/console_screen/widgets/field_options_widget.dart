import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:loga/screens/console_screen/controller/console_screen_controller.dart';
import 'package:loga/screens/console_screen/providers/speech_provider.dart';
import 'package:provider/provider.dart';

class FieldOptionsWidget extends StatelessWidget {
  final ConsoleScreenController consoleController;
  final ScrollController scrollController;
  final TextEditingController textEditingController;
  const FieldOptionsWidget({
    Key? key,
    required this.consoleController,
    required this.textEditingController,
    required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        LimitedBox(
          maxWidth: 250,
          child: TextField(
            maxLines: 1,
            controller: textEditingController,
            cursorWidth: 8,
            cursorColor: Theme.of(context).primaryColor,
            style: TextStyle(
              color: Theme.of(context).hintColor,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIconColor: Theme.of(context).primaryColor,
              hintText: 'DayExperience'.tr(),
              hintStyle: TextStyle(
                color: Theme.of(context).hintColor,
              ),
              focusColor: Theme.of(context).primaryColor,
              hoverColor: Theme.of(context).primaryColor,
            ),
          ),
        ),
        InkWell(
          onTap: () => consoleController.addNote(
            context: context,
            scrollController: scrollController,
            textEditingController: textEditingController,
          ),
          child: Icon(
            Icons.send,
            color: Theme.of(context).primaryColor,
          ),
        ),
        InkWell(
          onTap: () =>
              context.read<SpeechProvider>().speechToTextGet.isNotListening
                  ? context
                      .read<SpeechProvider>()
                      .startListening(textEditingController)
                  : context.read<SpeechProvider>().stopListening(),
          child: Icon(
            context.read<SpeechProvider>().speechToTextGet.isNotListening
                ? Icons.mic_none
                : Icons.mic,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}
