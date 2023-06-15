import 'package:flutter/material.dart';
import 'package:todo/core/extensions/build_context_extension.dart';
import 'package:todo/core/ui_kit/text_fields/task_text_field.dart';

import '../../core/images/svg_icons.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  bool light = true;
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
                  onPressed: () {},
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
                          const TaskTextField(),
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
                                value: light,
                                activeColor: context.colors.colorBlue,
                                onChanged: (bool value) {
                                  setState(() {
                                    light = value;
                                  });
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
                          SvgIcons(color: context.colors.labelDisable).delete,
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
