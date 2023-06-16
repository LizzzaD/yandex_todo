import 'package:copy_with_extension/copy_with_extension.dart';
import '../../../core/constants/importance_enum.dart';

part 'task_model.g.dart';

@CopyWith()
class TaskModel {
  TaskModel({
    required this.text,
    required this.importance,
    this.dateTime,
    this.isDone = false,
    this.id,
  });

  final String text;
  final Importance importance;
  final DateTime? dateTime;
  final bool isDone;
  int? id;
}
