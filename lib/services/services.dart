import 'package:hive/hive.dart';
import 'package:todo_app/model/tasks_model.dart';

class Service {
  final String _boxName = "tasksBox";

  Future<Box<TasksModel>> get _box async =>
      await Hive.openBox<TasksModel>(_boxName);

  Future<void> addTask(TasksModel tasksModel) async {
    ///c
    var box = await _box;
    await box.add(tasksModel);
  }

  Future<List<TasksModel>> getAllTodo() async {
    ///r
    var box = await _box;
    return box.values.toList();
  }

  Future<void> updateDeck(int index, TasksModel tasksModel) async {
    ///u
    var box = await _box;
    return box.putAt(index, tasksModel);
  }

  Future<void> deleteModel(int index) async {
    ////d
    var box = await _box;
    await box.delete(index);
  }
}
