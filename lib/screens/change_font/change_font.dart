import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:loga/database/scheme/db_scheme.dart';
import 'package:loga/database/todomodel.dart';
import 'package:loga/screens/change_font/controller/change_font_controller.dart';
import 'package:loga/screens/change_font/widgets/font_navigation_button.dart';
import 'package:loga/screens/change_font/widgets/switch_font_button.dart';
import 'package:loga/screens/console/widgets/user_tasks_widget.dart';
import 'package:provider/src/provider.dart';

class ChangeFontSizeScreen extends StatefulWidget {
  ChangeFontSizeScreen({Key? key}) : super(key: key);

  @override
  State<ChangeFontSizeScreen> createState() => _ChangeFontSizeScreenState();
}

class _ChangeFontSizeScreenState extends State<ChangeFontSizeScreen> {
  final _userDataStorage = Hive.box(DbScheme.userData);
  final _userReportsStorage = Hive.box<TodoModel>(DbScheme.userReports);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.70, // 86
          width: double.infinity,
          child: ValueListenableBuilder(
              valueListenable: _userReportsStorage.listenable(),
              builder: (context, Box<TodoModel> box, _) {
                return box.values.isEmpty
                    ? Center(
                        child: Text(
                          'DefaultText'.tr(),
                          style: TextStyle(
                            fontSize:
                                context.read<ChangeFontController>().fontSize,
                          ),
                        ),
                      )
                    : ListView.builder(
                        itemCount: box.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          TodoModel? todo = box.getAt(index);
                          return UserTasksFont(
                            fontSize:
                                context.watch<ChangeFontController>().fontSize,
                            date: todo!.createdAt.toString(),
                            text: todo.text,
                            userName: _userDataStorage.get(DbScheme.nickname),
                          );
                        });
              }),
        ),
        // bottom
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SwitchFontButton(
                fontSize: 12,
                method: () {
                  setState(() {
                    context.read<ChangeFontController>().fontSize = 12;
                  });
                },
              ),
              SwitchFontButton(
                fontSize: 13,
                method: () {
                  setState(() {
                    context.read<ChangeFontController>().fontSize = 13;
                  });
                },
              ),
              SwitchFontButton(
                fontSize: 14,
                method: () {
                  setState(() {
                    context.read<ChangeFontController>().fontSize = 14;
                  });
                },
              ),
              SwitchFontButton(
                fontSize: 15,
                method: () {
                  setState(() {
                    context.read<ChangeFontController>().fontSize = 15;
                  });
                },
              ),
              SwitchFontButton(
                fontSize: 16,
                method: () {
                  setState(() {
                    context.read<ChangeFontController>().fontSize = 16;
                  });
                },
              ),
              SwitchFontButton(
                fontSize: 17,
                method: () {
                  setState(() {
                    context.read<ChangeFontController>().fontSize = 17;
                  });
                },
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FontNavigationButton(
              icon: Icons.arrow_back_ios_new,
              method: () => Navigator.pop(context),
            ),
            FontNavigationButton(
              icon: Icons.cancel_rounded,
              method: null,
            ),
            FontNavigationButton(
              icon: Icons.done,
              method: () async =>
                  await context.read<ChangeFontController>().changeFontSize(),
            ),
          ],
        )
      ]),
    );
  }
}
