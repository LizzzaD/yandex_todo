import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/extensions/build_context_extension.dart';
import 'package:todo/core/images/svg_icons.dart';
import 'package:todo/core/ui_kit/buttons/new_task_button.dart';
import 'package:todo/core/ui_kit/cards/task_card.dart';
import 'package:todo/features/screens/task_screen.dart';

import '../controllers/tasks_controller.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: context.colors.backPrimary,
            pinned: true,
            snap: false,
            floating: false,
            expandedHeight: 126,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Мои дела',
                style: context.styles.medium20.copyWith(
                  color: context.colors.labelPrimary,
                ),
              ),
              expandedTitleScale: 32 / 20,
            ),
            actions: [
              IconButton(
                icon: context.read<TasksController>().showDone
                    ? SvgIcons(color: context.colors.colorBlue).visibility
                    : SvgIcons(color: context.colors.colorBlue).visibilityOff,
                onPressed: () {
                  context.read<TasksController>().changeShowDoneVisibility();
                },
                splashRadius: 24,
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
              child: Row(
                children: [
                  const SizedBox(
                    width: 76,
                  ),
                  Text(
                    'Выполнено - ${context.watch<TasksController>().tasksIsDoneLength}',
                    style: context.styles.regular16.copyWith(
                      color: context.colors.labelTertiary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 18),
                child: Container(
                  decoration: BoxDecoration(
                    color: context.colors.backSecondary,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        spreadRadius: 4,
                        offset: const Offset(0, 4),
                        color: Colors.black.withOpacity(0.06),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      ...context.watch<TasksController>().tasks.map(
                            (task) => TaskCard(task: task),
                          ),
                      const NewTaskButton(),
                      const SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const TaskScreen()),
          );
        },
        backgroundColor: context.colors.colorBlue,
        child: SvgIcons(color: context.colors.colorWhite).add,
      ),
    );
  }
}
