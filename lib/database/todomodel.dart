import 'package:hive/hive.dart';
part 'todomodel.g.dart';

// flutter packages pub run build_runner build --delete-conflicting-outputs
@HiveType(typeId: 1)
class TodoModel {
  @HiveField(0)
  final DateTime createdAt;
  @HiveField(1)
  final String text;

  TodoModel({
    required this.createdAt,
    required this.text,
  });
}
