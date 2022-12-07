import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:loga/database/scheme/db_scheme.dart';
import 'package:loga/database/todomodel.dart';

class ConsoleScreenController extends ChangeNotifier {
  final userDataStorage = Hive.box(DbScheme.userData);
  final userReportsStorage = Hive.box<TodoModel>(DbScheme.userReports);

  void scrollToLastElement(ScrollController scrollController) {
    if (scrollController.hasClients) {
      if (userReportsStorage.values.isEmpty) {
        print('dont scrooll');
      } else if (userReportsStorage.values.isNotEmpty) {
        scrollController.jumpTo(scrollController.position.maxScrollExtent);
        print('can scroll');
      }
    }
  }

  Future<void> addReport(
    TextEditingController textEditingController,
    BuildContext context,
  ) async {
    if (textEditingController.text.length >= 2) {
      await userReportsStorage.add(
        TodoModel(
          createdAt: DateTime.now(),
          text: textEditingController.text,
        ),
      );
      print('saved!');
      textEditingController.clear();
      FocusScope.of(context).unfocus();
    }
  }
}
