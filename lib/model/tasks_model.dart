import 'package:hive/hive.dart';

part 'tasks_model.g.dart';

@HiveType(typeId: 1)
class TasksModel {
  @HiveField(0)
  final String task;

  @HiveField(1)
  final bool isCompleted;

  @HiveField(2)
  final List<Todo> tasks;

  TasksModel(
      {required this.task, this.isCompleted = false, required this.tasks});
}

@HiveType(typeId: 2)
class Todo {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final bool isDone;

  Todo({required this.title, this.isDone = false});
}
