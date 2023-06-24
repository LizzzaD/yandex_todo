// ignore because in sql
// ignore_for_file: always_put_required_named_parameters_first
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/constants/enums/todo_priority.dart';
import '../../../../core/utils/json_mapper.dart';

part 'todo_model.freezed.dart';
part 'todo_model.g.dart';

@freezed
class TodoModel with _$TodoModel {
  const factory TodoModel({
    // id
    String? id,

    // text
    required String text,

    // priority
    required TodoPriority priority,

    // isDone
    @Default(false)
    @JsonKey(
      name: 'is_done',
      toJson: JsonMapper.boolToJson,
      fromJson: JsonMapper.boolFromJson,
    )
    bool isDone,

    // deadline
    @JsonKey(
      toJson: JsonMapper.dateTimeToJsonNullable,
      fromJson: JsonMapper.dateTimeFromJsonNullable,
    )
    DateTime? deadline,
  }) = _TodoModel;

  factory TodoModel.empty() {
    return const TodoModel(
      text: '',
      priority: TodoPriority.low,
    );
  }

  factory TodoModel.fromJson(Map<String, dynamic> json) => _$TodoModelFromJson(json);
}
