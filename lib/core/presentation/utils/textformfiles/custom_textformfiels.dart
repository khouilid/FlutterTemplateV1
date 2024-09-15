import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final bool readOnly;
  final bool autofocus;
  final TextInputAction? textInputAction;
  final void Function()? onEditingComplete;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? label;
  final Color? fillColor;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final void Function(String)? onChanged;
  final TextDirection? textDirection;
  final TextStyle? textStyle;
  final String? initialValue;
  final Color? disabledBorderColor;
  final int? hintMaxLines;
  final int? minLines;
  final int? maxLines;
  final EdgeInsetsGeometry contentPadding;
  final void Function()? onTap;

  const CustomTextFormField({
    super.key,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.suffixIcon,
    this.validator,
    this.readOnly = true,
    this.textInputAction,
    this.onEditingComplete,
    this.hintText,
    this.autofocus = false,
    this.hintStyle,
    this.label,
    this.fillColor,
    this.inputFormatters,
    this.enabled,
    this.onChanged,
    this.textDirection,
    this.prefixIcon,
    this.textStyle,
    this.initialValue,
    this.disabledBorderColor,
    this.hintMaxLines,
    this.maxLines,
    this.minLines,
    this.onTap,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: 16,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: Theme.of(context).colorScheme.primaryContainer,
        ),
      ),
      child: TextFormField(
        key: key,
        initialValue: initialValue,
        textDirection: textDirection,
        onChanged: onChanged,
        autofocus: autofocus,
        controller: controller,
        cursorWidth: 1,
        cursorColor: Theme.of(context).colorScheme.primary,
        readOnly: readOnly,
        enabled: enabled,
        keyboardType: keyboardType,
        obscureText: obscureText,
        textInputAction: textInputAction,
        onEditingComplete: onEditingComplete,
        inputFormatters: inputFormatters,
        maxLines: maxLines,
        minLines: minLines,
        onTap: onTap,
        decoration: InputDecoration(
          filled: true,
          fillColor: fillColor,
          label: label,
          errorMaxLines: 2,
          hintText: hintText,
          hintMaxLines: hintMaxLines ?? 1,
          hintStyle: hintStyle,
          contentPadding: contentPadding,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color:
                  disabledBorderColor ?? Theme.of(context).colorScheme.primary,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        style: textStyle ?? Theme.of(context).textTheme.bodyMedium,
        validator: validator,
      ),
    );
  }
}
