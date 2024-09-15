import 'package:flutter/material.dart';

import 'custom_textformfiels.dart';


class EmailTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final bool readOnly;
  final String? hintText;
  final void Function()? onEditingComplete;
  final Color? fillColor;
  final void Function(String)? onChanged;

  const   EmailTextFormField({
    super.key,
    required this.controller,
    this.readOnly = false,
    this.hintText,
    this.onEditingComplete,
    this.fillColor,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      onChanged: onChanged,
      readOnly: readOnly,
      fillColor: fillColor,
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      validator: (String? input) => input!.isEmpty
          ? null
          : input.trim().isNotEmpty
              ? null
              : "Invalid Email",
      textInputAction: TextInputAction.next,
      hintText: hintText,
      onEditingComplete: onEditingComplete,

    );
  }
}
