import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:loga/database/scheme/db_scheme.dart';
import 'package:loga/database/todomodel.dart';

class ConsoleScreenController extends ChangeNotifier {
  final userDataStorage = Hive.box(DbScheme.userData);
  final userReportsStorage = Hive.box<TodoModel>(DbScheme.userReports);

  void scrollToLastElement(ScrollController scrollController) {
    if (scrollController.hasClients && userReportsStorage.values.isNotEmpty) {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    }
  }

  Future<void> addNote({
    required TextEditingController textEditingController,
    required ScrollController scrollController,
    required BuildContext context,
  }) async {
    if (textEditingController.text.length >= 2) {
      await userReportsStorage.add(
        TodoModel(
          createdAt: DateTime.now(),
          text: textEditingController.text,
        ),
      );
      scrollToLastElement(scrollController);
      print('saved!');
      textEditingController.clear();
      FocusScope.of(context).unfocus();
    }
  }
}
