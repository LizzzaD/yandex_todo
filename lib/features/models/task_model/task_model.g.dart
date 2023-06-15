// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TaskModelCWProxy {
  TaskModel text(String text);

  TaskModel priority(TaskPriority priority);

  TaskModel dateTime(DateTime? dateTime);

  TaskModel isDone(bool isDone);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TaskModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TaskModel(...).copyWith(id: 12, name: "My name")
  /// ````
  TaskModel call({
    String? text,
    TaskPriority? priority,
    DateTime? dateTime,
    bool? isDone,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTaskModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTaskModel.copyWith.fieldName(...)`
class _$TaskModelCWProxyImpl implements _$TaskModelCWProxy {
  const _$TaskModelCWProxyImpl(this._value);

  final TaskModel _value;

  @override
  TaskModel text(String text) => this(text: text);

  @override
  TaskModel priority(TaskPriority priority) => this(priority: priority);

  @override
  TaskModel dateTime(DateTime? dateTime) => this(dateTime: dateTime);

  @override
  TaskModel isDone(bool isDone) => this(isDone: isDone);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TaskModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TaskModel(...).copyWith(id: 12, name: "My name")
  /// ````
  TaskModel call({
    Object? text = const $CopyWithPlaceholder(),
    Object? priority = const $CopyWithPlaceholder(),
    Object? dateTime = const $CopyWithPlaceholder(),
    Object? isDone = const $CopyWithPlaceholder(),
  }) {
    return TaskModel(
      text: text == const $CopyWithPlaceholder() || text == null
          ? _value.text
          // ignore: cast_nullable_to_non_nullable
          : text as String,
      priority: priority == const $CopyWithPlaceholder() || priority == null
          ? _value.priority
          // ignore: cast_nullable_to_non_nullable
          : priority as TaskPriority,
      dateTime: dateTime == const $CopyWithPlaceholder()
          ? _value.dateTime
          // ignore: cast_nullable_to_non_nullable
          : dateTime as DateTime?,
      isDone: isDone == const $CopyWithPlaceholder() || isDone == null
          ? _value.isDone
          // ignore: cast_nullable_to_non_nullable
          : isDone as bool,
    );
  }
}

extension $TaskModelCopyWith on TaskModel {
  /// Returns a callable class that can be used as follows: `instanceOfTaskModel.copyWith(...)` or like so:`instanceOfTaskModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TaskModelCWProxy get copyWith => _$TaskModelCWProxyImpl(this);
}
