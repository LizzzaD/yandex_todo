import 'package:flutter/material.dart';
import 'package:todo/core/extensions/build_context_extension.dart';

class TaskTextField extends StatelessWidget {
  const TaskTextField({
    this.controller,
    this.onChanged,
    super.key,
  });

  final TextEditingController? controller;
  final void Function(String text)? onChanged;

  @override
  Widget build(BuildContext context) {
    const OutlineInputBorder defaultBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.all(Radius.circular(8)),
    );
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            spreadRadius: 4,
            offset: const Offset(0, 4),
            color: Colors.black.withOpacity(0.06),
          ),
        ],
      ),
      width: double.infinity,
      child: TextFormField(
        onChanged: onChanged,
        controller: controller,
        style: context.styles.regular16
            .copyWith(color: context.colors.labelPrimary),
        minLines: 3,
        maxLines: 30,
        autocorrect: false,
        decoration: InputDecoration(
          hintText: 'Что надо сделать…',
          contentPadding: const EdgeInsets.all(16),
          isDense: false,
          filled: true,
          fillColor: context.colors.backSecondary,
          border: defaultBorder,
          focusedBorder: defaultBorder,
          enabledBorder: defaultBorder,
          errorBorder: defaultBorder,
          disabledBorder: defaultBorder,
        ),
      ),
    );
  }
}
