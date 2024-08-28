import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'custom_textformfiels.dart';

class PasswordTextFormField extends HookWidget {
  final TextEditingController controller;
  final void Function()? onEditingComplete;
  final bool readOnly;
  final String? Function(String?)? validator;
  final String? hintText;
  final Color? fillColor;
  final TextInputAction? textInputAction;
  final bool autofocus;

  const PasswordTextFormField({
    super.key,
    required this.controller,
    this.onEditingComplete,
    this.readOnly = false,
    this.validator,
    this.hintText,
    this.fillColor,
    this.textInputAction = TextInputAction.done,
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> isPasswordHidden = useState<bool>(true);
    return CustomTextFormField(
      autofocus: autofocus,
      fillColor: fillColor,
      hintText: hintText,
      readOnly: readOnly,
      controller: controller,
      obscureText: isPasswordHidden.value,
      maxLines: 1,
      suffixIcon: ExcludeFocusTraversal(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: IconButton(
            icon: Icon(
              isPasswordHidden.value ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () => isPasswordHidden.value = !isPasswordHidden.value,
            color: Theme.of(context).focusColor,
            splashRadius: 12,
          ),
        ),
      ),
      // validator: validator ??
      //     (String? input) => isPasswordValid(input!)
      //         ? null
      //         : context.l10n.passwordValidationMessage,
      textInputAction: textInputAction,
      onEditingComplete: onEditingComplete,
    );
  }
}
