import 'package:flutter/cupertino.dart';

import '../../core/utils/logger.dart';
import '../models/task_model/task_model.dart';

class TasksController with ChangeNotifier {
  final List<TaskModel> _tasks = [];

  List<TaskModel> get tasks => _showDone
      ? _tasks
      : _tasks.where((e) => !e.isDone).toList();

  bool _showDone = true;
  bool get showDone => _showDone;

  int get tasksIsDoneLength => _tasks.where((e) => e.isDone).length;

  void changeShowDoneVisibility() {
    _showDone = !_showDone;
    notifyListeners();
  }

  void deleteTask(int taskId) {
    Logger.l(
        'TODO DELETED ${_tasks.firstWhere((e) => e.id == taskId)}');
    _tasks.removeWhere((e) => e.id == taskId);
    notifyListeners();
  }

  void switchTaskIsDone(int taskId) {
    Logger.l('TODO  ${_tasks.firstWhere((e) => e.id == taskId)}');
    final index = _tasks.indexWhere((e) => e.id == taskId);
    _tasks[index] = _tasks[index].copyWith(
      isDone: !_tasks[index].isDone,
    );
    notifyListeners();
  }

  void createOrUpdateTask(TaskModel task) {
    if (task.id == null) {
      _tasks.add(task.copyWith(id: _tasks.length + 1));
    } else {
      final index = _tasks.indexWhere((e) => e.id == task.id!);
      _tasks[index] = task;
    }
  }
}
