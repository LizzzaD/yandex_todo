import 'package:flutter/material.dart';
import 'package:todo/core/extensions/build_context_extension.dart';
import 'package:todo/core/images/svg_icons.dart';

class TaskListItem extends StatefulWidget {
  const TaskListItem({
    required this.text,
    super.key,
  });

  final String text;

  @override
  State<TaskListItem> createState() => _TaskListItemState();
}

class _TaskListItemState extends State<TaskListItem> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: Container(
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
      key: UniqueKey(),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Checkbox(
              activeColor: context.colors.colorGreen,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value!;
                });
              },
              value: isChecked,
              tristate: false,
              splashRadius: 24,
            ),
            const SizedBox(
              width: 14,
            ),
            Expanded(
              child: Text(
                'Купить что-тоКупить что-то, где-то, зачем-то, но зачем не очень понятноКупить что-то, где-то, зачем-то, но зачем не очень понятно',
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: context.styles.regular16.copyWith(
                  color: context.colors.labelPrimary,
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
    );
  }
}
