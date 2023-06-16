import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/extensions/build_context_extension.dart';
import 'package:todo/core/images/svg_icons.dart';
import 'package:todo/features/controllers/tasks_controller.dart';
import 'package:todo/features/models/task_model/task_model.dart';

import '../../constants/importance_enum.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({
    required this.task,
    super.key,
  });

  final TaskModel task;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 84, minHeight: 48),
        child: Container(
          color: context.colors.colorGreen,
          child: Row(
            children: [
              const SizedBox(
                width: 27,
              ),
              SvgIcons(color: context.colors.colorWhite).check,
              const Spacer(),
            ],
          ),
        ),
      ),
      secondaryBackground: Container(
        color: context.colors.colorRed,
        child: Row(
          children: [
            const Spacer(),
            SvgIcons(color: context.colors.colorWhite).delete,
            const SizedBox(
              width: 27,
            ),
          ],
        ),
      ),
      key: ValueKey(widget.task.id),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Checkbox(
              activeColor: context.colors.colorGreen,
              onChanged: (bool? value) {
                context.read<TasksController>().switchTaskIsDone(widget.task.id!);
              },
              value: widget.task.isDone,
              tristate: false,
              splashRadius: 24,
            ),
            const SizedBox(
              width: 14,
            ),
            Expanded(
              child: RichText(
                text: TextSpan(
                  style: context.styles.regular16.copyWith(
                    color: widget.task.isDone
                        ? context.colors.labelTertiary
                        : context.colors.labelPrimary,
                    decoration: widget.task.isDone ? TextDecoration.lineThrough : null,
                  ),
                  children: [
                    TextSpan(
                      text: !widget.task.isDone && widget.task.importance == Importance.high
                          ? '!! '
                          : '',
                      style: context.styles.medium20.copyWith(color: context.colors.colorRed),
                    ),
                    TextSpan(
                      text: widget.task.text,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 14,
            ),
            IconButton(
              splashRadius: 24,
              onPressed: () {},
              icon: SvgIcons(color: context.colors.labelTertiary).infoOutline,
            ),
          ],
        ),
      ),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.startToEnd) {
          context.read<TasksController>().switchTaskIsDone(widget.task.id!);
          return false;
        } else {
          return true;
        }
      },
    );
  }
}
