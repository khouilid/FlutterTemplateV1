import 'package:flutter/material.dart';

TextStyle getRobotoRegularTheme({
  required BuildContext context,
  double size = 14,
  GetColor getColor = GetColor.primary,
  Color? colorTheme,
}) {
  final color = setColor(getColor, context);
  final robotoBold = Theme.of(context).textTheme.displayMedium!.copyWith(
      fontSize: size, fontWeight: FontWeight.w400, color: colorTheme ?? color);
  return robotoBold;
}

TextStyle getRobotoMediumTheme({
  required BuildContext context,
  double size = 14,
  GetColor getColor = GetColor.primary,
  Color? colorTheme,
}) {
  final color = setColor(getColor, context);
  final robotoBold = Theme.of(context).textTheme.bodyMedium!.copyWith(
      fontSize: size, fontWeight: FontWeight.w500, color: colorTheme ?? color);
  return robotoBold;
}

TextStyle getNunitoMediumTheme({
  required BuildContext context,
  double size = 14,
  GetColor getColor = GetColor.primary,
  Color? colorTheme,
}) {
  final color = setColor(getColor, context);
  final robotoBold = Theme.of(context).textTheme.displaySmall!.copyWith(
      fontSize: size, fontWeight: FontWeight.w500, color: colorTheme ?? color);
  return robotoBold;
}

TextStyle getRobotoBoldTheme({
  required BuildContext context,
  double size = 14,
  GetColor getColor = GetColor.primary,
  Color? colorTheme,
}) {
  final color = setColor(getColor, context);
  final robotoBold = Theme.of(context).textTheme.bodyMedium!.copyWith(
      fontSize: size, fontWeight: FontWeight.bold, color: colorTheme ?? color);

  return robotoBold;
}

TextStyle getRobotoAppBarTextTheme({
  required BuildContext context,
  double size = 0,
}) {
  final robotoBold = Theme.of(context).textTheme.displayLarge!.copyWith(
        fontWeight: FontWeight.w600,
      );
  return robotoBold;
}

Color? setColor(GetColor getColor, BuildContext context) {
  switch (getColor) {
    case GetColor.greyMedium:
      return Theme.of(context).textTheme.displayMedium!.color;
    case GetColor.grey:
      return Theme.of(context).textTheme.displaySmall!.color;
    case GetColor.primary:
      return Theme.of(context).primaryColor;
    case GetColor.greyLight:
      return Theme.of(context).textTheme.displayMedium!.color!.withOpacity(0.5);
    case GetColor.light:
      return Theme.of(context).textTheme.bodyMedium!.color;
    default:
      return Theme.of(context).textTheme.displayLarge!.color;
  }
}

enum GetColor { primary, grey, greyMedium, greyLight, light }
