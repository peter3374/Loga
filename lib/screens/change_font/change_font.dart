import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:loga/database/todomodel.dart';
import 'package:loga/model/controllers/ChangeFont/changeFontLogic.dart';
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
  var _userDataStorage = Hive.box('user_data');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.70, // 86
          width: double.infinity,
          child: ValueListenableBuilder(
              valueListenable: Hive.box<TodoModel>('user_reports').listenable(),
              builder: (context, Box<TodoModel> box, _) {
                if (box.values.isEmpty) {
                  return Center(
                      child: Text(
                    'DefaultText'.tr(),
                    style: TextStyle(
                      fontSize: context.read<ChangeFontLogic>().fontSize,
                    ),
                  ));
                } else {
                  return ListView.builder(
                      itemCount: box.length,
                      shrinkWrap: true,
                      itemBuilder: (
                        context,
                        index,
                      ) {
                        TodoModel? todo = box.getAt(index);
                        return UserTasksFont(
                          fontSize: context.watch<ChangeFontLogic>().fontSize,
                          date: todo!.createdAt.toString(),
                          text: todo.text,
                          userName: _userDataStorage.get('nickname'),
                        );
                      });
                }
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
                    context.read<ChangeFontLogic>().fontSize = 12;
                  });
                },
              ),
              SwitchFontButton(
                fontSize: 13,
                method: () {
                  setState(() {
                    context.read<ChangeFontLogic>().fontSize = 13;
                  });
                },
              ),
              SwitchFontButton(
                fontSize: 14,
                method: () {
                  setState(() {
                    context.read<ChangeFontLogic>().fontSize = 14;
                  });
                },
              ),
              SwitchFontButton(
                fontSize: 15,
                method: () {
                  setState(() {
                    context.read<ChangeFontLogic>().fontSize = 15;
                  });
                },
              ),
              SwitchFontButton(
                fontSize: 16,
                method: () {
                  setState(() {
                    context.read<ChangeFontLogic>().fontSize = 16;
                  });
                },
              ),
              SwitchFontButton(
                fontSize: 17,
                method: () {
                  setState(() {
                    context.read<ChangeFontLogic>().fontSize = 17;
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
              method: () {
                context.read<ChangeFontLogic>().changeFontSize();
              },
            ),
          ],
        )
      ]),
    );
  }
}
