import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:loga/database/scheme/db_scheme.dart';
import 'package:loga/database/todomodel.dart';
import 'package:loga/screens/change_font_screen/controller/change_font_controller.dart';
import 'package:loga/screens/console_screen/controller/console_screen_controller.dart';
import 'package:loga/screens/console_screen/providers/speech_provider.dart';
import 'package:loga/screens/console_screen/widgets/bottom_sheet_widget.dart';
import 'package:loga/screens/console_screen/widgets/user_message_widget.dart';
import 'package:provider/src/provider.dart';

class ConsoleScreen extends StatefulWidget {
  @override
  State<ConsoleScreen> createState() => _ConsoleScreenState();
}

class _ConsoleScreenState extends State<ConsoleScreen> {
  TextEditingController _textEditingController = TextEditingController();
  ScrollController _scrollConsoleController =
      ScrollController(initialScrollOffset: 0);

  @override
  void initState() {
    super.initState();
    final consoleController =
        Provider.of<ConsoleScreenController>(context, listen: false);
    context.read<SpeechProvider>().initSpeech();
    context.read<ChangeFontController>().fontSize =
        consoleController.userDataStorage.get(DbScheme.currentFontSize);
    consoleController.scrollToLastElement(_scrollConsoleController);
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _scrollConsoleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _consoleController = Provider.of<ConsoleScreenController>(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.85, // 86
            width: double.infinity,
            child: ValueListenableBuilder(
                valueListenable:
                    _consoleController.userReportsStorage.listenable(),
                builder: (context, Box<TodoModel> box, _) {
                  return box.values.isEmpty
                      ? Center(
                          child: Text(
                            'EmptyList'.tr() + ' \😔',
                            style: TextStyle(
                              fontSize: 22,
                              color: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      ?.color ??
                                  Colors.white,
                            ),
                          ),
                        )
                      : ListView.builder(
                          controller: _scrollConsoleController,
                          itemCount: box.length,
                          shrinkWrap: true,
                          itemBuilder: (context, i) {
                            TodoModel? todo = box.getAt(i);
                            return UserMessageWidget(
                              fontSize: context
                                  .watch<ChangeFontController>()
                                  .fontSize,
                              date: todo!.createdAt,
                              text: todo.text,
                              userName: _consoleController.userDataStorage
                                  .get(DbScheme.nickname),
                            );
                          });
                }),
          ),
          BottomSheetWidget(
            consoleController: _consoleController,
            textEditingController: _textEditingController,
          )
        ],
      ),
    );
  }
}
