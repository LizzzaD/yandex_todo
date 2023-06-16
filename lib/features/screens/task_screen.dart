import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/constants/importance_enum.dart';
import 'package:todo/core/extensions/build_context_extension.dart';
import 'package:todo/core/ui_kit/text_fields/task_text_field.dart';
import 'package:todo/features/controllers/tasks_controller.dart';
import 'package:todo/features/models/task_model/task_model.dart';
import 'package:todo/features/screens/main_screen.dart';

import '../../core/images/svg_icons.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key, this.task}) : super(key: key);

  final TaskModel? task;

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  late TaskModel _task;

  @override
  void initState() {
    _task = widget.task ?? TaskModel(text: '', importance: Importance.none);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: context.colors.backPrimary,
            pinned: true,
            snap: false,
            floating: true,
            expandedHeight: 60,
            leading: IconButton(
              onPressed: () {},
              icon: SvgIcons(color: context.colors.labelPrimary).close,
              splashRadius: 24,
            ),
            title: Row(
              children: [
                const Spacer(),
                TextButton(
                  onPressed: () {
                    context.read<TasksController>().createOrUpdateTask(_task);
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => const MainScreen()),
                    );
                  },
                  child: Text(
                    'СОХРАНИТЬ',
                    style: context.styles.medium14,
                  ),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 6,
                          ),
                          TaskTextField(
                            onChanged: (value) {
                              _task = _task.copyWith(text: value);
                            },
                          ),
                          const SizedBox(
                            height: 28,
                          ),
                          Text(
                            'Важность',
                            style: context.styles.regular16
                                .copyWith(color: context.colors.labelPrimary),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            'Нет',
                            style: context.styles.regular14.copyWith(
                              color: context.colors.labelTertiary,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Container(
                            color: context.colors.supportSeparator,
                            height: 1,
                            width: double.infinity,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Сделать до',
                                style: context.styles.regular16.copyWith(
                                    color: context.colors.labelPrimary),
                              ),
                              Switch(
                                value: _task.dateTime != null,
                                activeColor: context.colors.colorBlue,
                                onChanged: (bool value) async {
                                  if (value == true) {
                                    final dateTime = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime(2100),
                                    );
                                    if (dateTime != null) {
                                      _task = _task.copyWith(
                                        dateTime: dateTime,
                                      );
                                    }
                                  } else {
                                    _task = _task.copyWith(
                                      dateTime: null,
                                    );
                                  }
                                  setState(() {});
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      color: context.colors.supportSeparator,
                      height: 1,
                      width: double.infinity,
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          SvgIcons(
                            color: _task.id == null
                                ? context.colors.labelDisable
                                : context.colors.colorRed,
                          ).delete,
                          const SizedBox(
                            width: 16,
                          ),
                          Text(
                            'Удалить',
                            style: context.styles.regular16.copyWith(
                              color: context.colors.labelDisable,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
