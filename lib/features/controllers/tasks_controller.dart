import 'package:flutter/cupertino.dart';
import '../models/task_model/task_model.dart';

class TasksController extends ChangeNotifier {
  final List<TaskModel> _tasks = [];

  List<TaskModel> get tasks => _tasks;

  void createTask(String text) {
    final newTask = TaskModel(text: text, priority: TaskPriority.high, isDone: false);
    _tasks.add(newTask);
    notifyListeners();
  }
}