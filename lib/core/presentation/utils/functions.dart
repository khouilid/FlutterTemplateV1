import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


/// Returns the screen width
double getDimension(double dimension, double limit) {
  if (dimension > limit) {
    return limit;
  }
  return dimension;
}


/// Checks if the device is a desktop
bool get isDesktop {
  if (kIsWeb) return false;
  return [
    TargetPlatform.windows,
    TargetPlatform.linux,
    TargetPlatform.macOS,
  ].contains(defaultTargetPlatform);
}

/// Checks if the device is a windows desktop
bool get isWindows {
  if (kIsWeb) return false;
  return [
    TargetPlatform.windows,
  ].contains(defaultTargetPlatform);
}


/// Checks if the device is a MacOs
bool get isMacOs {
  if (kIsWeb) return false;
  return [
    TargetPlatform.macOS,
  ].contains(defaultTargetPlatform);
}


/// Checks if the device is a Android
bool get isAndroid {
  if (kIsWeb) return false;
  return [
    TargetPlatform.android,
  ].contains(defaultTargetPlatform);
}


/// Checks if the device is a iOS
bool get isiOS {
  if (kIsWeb) return false;
  return [
    TargetPlatform.iOS,
  ].contains(defaultTargetPlatform);
}


/// Password validation
bool isPasswordValid(String input) {
  return RegExp(
    r'^(?=.*?[A-z])(?=.*?[0-9]).{8,}$',
  ).hasMatch(input);
}


/// hide keyboard
void hideKeyBoard() {
  WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
}




String formatTimer(int seconds) {
  final int hours = seconds ~/ 3600;
  final int remainingSeconds = seconds % 3600;
  final int minutes = remainingSeconds ~/ 60;
  final int finalSeconds = remainingSeconds % 60;
  final String formattedHours = hours.toString().padLeft(2, '0');
  final String formattedMinutes = minutes.toString().padLeft(2, '0');
  final String formattedSeconds = finalSeconds.toString().padLeft(2, '0');

  return "${formattedHours != '00' ? '$formattedHours:' : ''}$formattedMinutes:$formattedSeconds";
}
