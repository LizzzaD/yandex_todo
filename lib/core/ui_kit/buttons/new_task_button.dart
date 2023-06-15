import 'package:flutter/material.dart';
import 'package:todo/core/extensions/build_context_extension.dart';

class NewTaskButton extends StatelessWidget {
  const NewTaskButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: context.colors.labelTertiary,
        backgroundColor: context.colors.backSecondary,
       shadowColor: Colors.grey.withOpacity(0.02),

        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: () {},
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Row(
          children: [
            const SizedBox(
              width: 56,
            ),
            Text(
              'Новое',
              style: context.styles.regular16,
            ),
          ],
        ),
      ),
    );
  }
}
