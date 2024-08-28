import 'package:flash/flash.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';

enum Severity {
  success,
  error,
  information,
  warning,
}

Future<void> showToast({
  required BuildContext context,
  required String message,
  Severity severity = Severity.information,
  AlignmentGeometry? alignment,
  Duration duration = const Duration(seconds: 2),
}) async {
  context.showFlash<bool>(
    duration: duration,
    builder: (BuildContext context, FlashController<bool> controller) =>
        FlashBar(
      controller: controller,
      shadowColor: Colors.grey.shade100,
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
      margin: const EdgeInsets.all(16.0),
      clipBehavior: Clip.antiAlias,
      icon: _FlashIcon(severity: severity),
      content: Text(
        message,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
  );
}

class _FlashIcon extends StatelessWidget {
  final Severity severity;
  const _FlashIcon({required this.severity});

  @override
  Widget build(BuildContext context) {
    switch (severity) {
      case Severity.error:
        return Icon(
          Icons.error,
          color: Theme.of(context).colorScheme.error,
        );
      case Severity.information:
        return const Icon(
          Icons.info,
          color: Colors.blueAccent,
        );
      case Severity.warning:
        return const Icon(
          Icons.warning,
          color: Colors.yellowAccent,
        );
      default:
        return const Icon(
          Icons.check_circle,
          color: Colors.greenAccent,
        );
    }
  }
}
