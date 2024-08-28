import 'package:flutter/material.dart';

import 'custom_textformfiels.dart';

class PhoneTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final bool readOnly;
  final String? hintText;
  final void Function()? onEditingComplete;
  final Color? fillColor;
  final void Function(String)? onChanged;

  final Widget prefixWidget;

  const PhoneTextFormField({
    super.key,
    required this.controller,
    this.readOnly = false,
    this.hintText,
    this.onEditingComplete,
    this.fillColor,
    this.onChanged,
    this.prefixWidget = const SizedBox(),
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      onChanged: onChanged,
      readOnly: readOnly,
      fillColor: fillColor,
      controller: controller,
      keyboardType: TextInputType.phone,
      validator: (String? input) => input!.isEmpty
          ? null
          : input.trim().isNotEmpty
              ? null
              : "Invalid Phone Number",
      textInputAction: TextInputAction.next,
      hintText: hintText,
      onEditingComplete: onEditingComplete,
      prefixIcon: Container(
        alignment: Alignment.center,
        height: 40,
        width: 70,
        child: Center(child: prefixWidget),
      ),
    );
  }
}
