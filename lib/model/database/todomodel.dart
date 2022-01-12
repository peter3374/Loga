import 'package:hive/hive.dart';
part 'todomodel.g.dart'; // for build runner

// flutter packages pub run build_runner build --delete-conflicting-outputs
@HiveType(typeId: 1)
class TodoModel {
  @HiveField(0)
  final date;
  @HiveField(1)
  final text;

  TodoModel({
    required this.date,
    required this.text,
  });
}
