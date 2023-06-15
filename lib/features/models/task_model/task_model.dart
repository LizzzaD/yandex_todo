import 'package:copy_with_extension/copy_with_extension.dart';

part 'task_model.g.dart';


enum TaskPriority { no, low, high }

@CopyWith()
class TaskModel {
  final String text;
  final TaskPriority priority;
  final DateTime? dateTime;
  final bool isDone;

  TaskModel({
    required this.text,
    required this.priority,
    this.dateTime,
    this.isDone = false,
  });
}
