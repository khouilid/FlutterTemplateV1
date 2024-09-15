import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template/core/presentation/managers/color_manager.dart';

class ActionButton extends ConsumerWidget {
  final VoidCallback onPressed;
  final double height;
  final double width;
  final String action;
  final Widget child;
  final double borderRadius;
  final Color color;
  final Color borderSideColor;
  final double elevation;

  const ActionButton(
      {Key? key,
      required this.onPressed,
      this.height = 50,
      this.width = 50,
      this.action = "",
      required this.child,
      this.borderRadius = 5,
      this.color = Colors.transparent,
      this.borderSideColor = Colors.transparent,
      this.elevation = 1.0})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: elevation,
          padding: EdgeInsets.zero,
          backgroundColor:
              color == Colors.transparent ? AppColors.chateauGreen : color,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              side: BorderSide(color: borderSideColor)),
        ),
        child: Center(child: child),
      ),
    );
  }
}

class ActionButtonIcon extends ConsumerWidget {
  final VoidCallback onPressed;
  final double height;
  final double width;
  final String action;
  final Widget child;
  final Widget icon;
  final double borderRadius;
  final Color color;
  final Color borderSideColor;
  final double elevation;

  const ActionButtonIcon(
      {Key? key,
      required this.onPressed,
      this.height = 50,
      this.width = 50,
      this.action = "",
      required this.child,
      required this.icon,
      this.borderRadius = 15,
      this.color = Colors.transparent,
      this.borderSideColor = Colors.transparent,
      this.elevation = 1.0})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var primary;
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: elevation,
          padding: EdgeInsets.zero,
          backgroundColor:
              color == Colors.transparent ? AppColors.chateauGreen : color,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              side: BorderSide(color: borderSideColor)),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
                width: 20,
                child: icon,
              ),
              const SizedBox(width: 10),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
