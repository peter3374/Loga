import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:loga/database/scheme/db_scheme.dart';
import 'package:loga/database/todomodel.dart';
import 'package:loga/screens/change_font/controller/change_font_controller.dart';
import 'package:loga/screens/console/controller/speech_provider.dart';
import 'package:loga/screens/change_font/change_font.dart';
import 'package:loga/screens/console/widgets/console_button.dart';
import 'package:loga/screens/console/widgets/user_message_widget.dart';
import 'package:loga/screens/locale/locale_screen.dart';
import 'package:loga/screens/pick_theme/pick_theme_screen.dart';
import 'package:loga/screens/erase_data/erase_data_screen.dart';
import 'package:loga/themes/theme_manager.dart';
import 'package:provider/src/provider.dart';

class ConsoleScreen extends StatefulWidget {
  @override
  State<ConsoleScreen> createState() => _ConsoleScreenState();
}

class _ConsoleScreenState extends State<ConsoleScreen> {
  TextEditingController _textEditingController = TextEditingController();
  ScrollController _scrollConsoleController =
      ScrollController(initialScrollOffset: 0);
  final _userDataStorage = Hive.box(DbScheme.userData);
  final _userReportsStorage = Hive.box<TodoModel>(DbScheme.userReports);
  @override
  void initState() {
    super.initState();
    context.read<SpeechProvider>().initSpeech();
    context.read<ChangeFontController>().fontSize =
        _userDataStorage.get(DbScheme.currentFontSize);
    _scrollToLastElement();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _scrollConsoleController.dispose();
    super.dispose();
  }

  _scrollToLastElement() {
//FIXED   ScrollController not attached to any scroll views.
    if (_scrollConsoleController.hasClients) {
      if (_userReportsStorage.values.isEmpty) {
        print('dont scrooll');
      } else if (_userReportsStorage.values.isNotEmpty) {
        _scrollConsoleController
            .jumpTo(_scrollConsoleController.position.maxScrollExtent);
        print('can scroll');
      }
    }
  }

  Future<void> addReport() async {
    if (_textEditingController.text.length >= 2) {
      await _userReportsStorage.add(TodoModel(
          createdAt: DateTime.now(), text: _textEditingController.text));
      print('saved!');
      _textEditingController.text = '';
      FocusScope.of(context).unfocus();
    }
  }

  DateTime _timeNow = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.85, // 86
            width: double.infinity,
            child: ValueListenableBuilder(
                valueListenable: _userReportsStorage.listenable(),
                builder: (context, Box<TodoModel> box, _) {
                  if (box.values.isEmpty) {
                    return Center(
                      child: Text(
                        'EmptyList'.tr() + ' \😔',
                        style: TextStyle(
                          fontSize: 22,
                          color: Theme.of(context).textTheme.headline6?.color ??
                              Colors.white,
                        ),
                      ),
                    );
                  } else {
                    return ListView.builder(
                        controller: _scrollConsoleController,
                        itemCount: box.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          TodoModel? todo = box.getAt(index);
                          return UserMessageWidget(
                            fontSize:
                                context.watch<ChangeFontController>().fontSize,
                            date: todo!.createdAt,
                            text: todo.text,
                            userName: _userDataStorage.get(DbScheme.nickname),
                          );
                        });
                  }
                }),
          ),

          // down side
          DraggableScrollableSheet(
              expand: true,
              initialChildSize: 0.14,
              minChildSize: 0.14,
              maxChildSize: 0.5,
              builder: (BuildContext context, controller) {
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
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 155,
                            vertical: 9,
                          ),
                          child: Container(
                            width: 40,
                            height: 4,
                            decoration: BoxDecoration(
                              color:
                                  Theme.of(context).textTheme.headline6!.color,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        Text(
                          'Today'.tr() +
                              ' ${DateFormat('yMd').format(_timeNow)}',
                          softWrap: true,
                          textAlign: TextAlign.left,
                          maxLines: 3,
                          style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.headline6!.color,
                              fontSize: 15),
                        ),
                        StatefulBuilder(
                          builder: (context, state) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                LimitedBox(
                                  // maxWidth: MediaQuery.of(context).size.height * 0.1,
                                  maxWidth: 250,
                                  child: TextField(
                                    maxLines: 1,
                                    controller: _textEditingController,
                                    autocorrect: true,
                                    cursorWidth: 8,
                                    cursorColor: Theme.of(context).primaryColor,
                                    style: TextStyle(
                                      color: Theme.of(context).hintColor,
                                    ),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      prefixIconColor:
                                          Theme.of(context).primaryColor,
                                      hintText: 'DayExperience'.tr(),
                                      hintStyle: TextStyle(
                                        color: Theme.of(context).hintColor,
                                      ),
                                      focusColor:
                                          Theme.of(context).primaryColor,
                                      hoverColor:
                                          Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () => addReport(),
                                  child: Icon(
                                    Icons.send,
                                    color: Theme.of(context).buttonColor,
                                  ),
                                ),
                                InkWell(
                                  onTap: () => context
                                          .read<SpeechProvider>()
                                          .speechToTextGet
                                          .isNotListening
                                      ? context
                                          .read<SpeechProvider>()
                                          .startListening(
                                              _textEditingController)
                                      : context
                                          .read<SpeechProvider>()
                                          .stopListening(),
                                  child: Icon(
                                    context
                                            .read<SpeechProvider>()
                                            .speechToTextGet
                                            .isNotListening
                                        ? Icons.mic_none
                                        : Icons.mic,
                                    color: Theme.of(context).buttonColor,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        // buttons
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Wrap(
                            runSpacing: 25,
                            spacing: 0,
                            alignment: WrapAlignment.center,
                            children: [
                              // ConsoleButton(
                              //   leadingIcon: Icons.supervised_user_circle,
                              //   title: 'User',
                              //   onclick: () => null,
                              // ),
                              ConsoleButton(
                                leadingIcon: Icons.grid_4x4_outlined,
                                title: 'GridView'.tr(),
                                onclick: () => null,
                              ),

                              ConsoleButton(
                                leadingIcon: Icons.style,
                                title: 'Themes'.tr(),
                                onclick: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PickThemeScreen())),
                              ),
                              ConsoleButton(
                                leadingIcon: Icons.format_size,
                                title: 'FontSize'.tr(),
                                onclick: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ChangeFontSizeScreen(),
                                  ),
                                ),
                              ),
                              // CustomButton1(
                              //   leadingIcon: Icons.timeline,
                              //   title: 'Stats',
                              //   onclick: () => null,
                              // ),
                              ConsoleButton(
                                leadingIcon: Icons.star,
                                title: 'RateApp'.tr(),
                                onclick: () => null,
                              ),
                              ConsoleButton(
                                  leadingIcon: Icons.delete,
                                  title: 'EraseData'.tr(),
                                  onclick: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => EraseDataScreen(),
                                      ),
                                    );
                                  }),
                              ConsoleButton(
                                leadingIcon: Icons.translate,
                                title: 'Lang'.tr(),
                                onclick: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => LocaleScreen(),
                                  ),
                                ),
                              ),
                              ConsoleButton(
                                leadingIcon: Icons.power_settings_new,
                                title: 'Exit'.tr(),
                                onclick: () async =>
                                    await SystemNavigator.pop(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}
