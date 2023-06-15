import 'package:flutter/material.dart';
import 'package:todo/core/extensions/build_context_extension.dart';
import 'package:todo/core/images/svg_icons.dart';
import 'package:todo/core/ui_kit/buttons/new_task_button.dart';
import 'package:todo/core/ui_kit/cards/task_list_item.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: context.colors.colorBlue,
        child: SvgIcons(color: context.colors.colorWhite).add,
      ),
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
                icon: SvgIcons(color: context.colors.colorBlue).visibility,
                onPressed: () {},
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
                    'Выполнено - 5',
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
                  child: const Column(
                    children: [
                      SizedBox(
                        height: 8,
                      ),
                      TaskListItem(
                        text: '1',
                      ),
                      TaskListItem(
                        text: '3',
                      ),
                      NewTaskButton(),
                      SizedBox(
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
    );
  }
}
