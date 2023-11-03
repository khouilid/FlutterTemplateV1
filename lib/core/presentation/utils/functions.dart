import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

double getDimension(double dimension, double limit) {
  if (dimension > limit) {
    return limit;
  }
  return dimension;
}

bool get isDesktop {
  if (kIsWeb) return false;
  return [
    TargetPlatform.windows,
    TargetPlatform.linux,
    TargetPlatform.macOS,
  ].contains(defaultTargetPlatform);
}

bool get isWindows {
  if (kIsWeb) return false;
  return [
    TargetPlatform.windows,
  ].contains(defaultTargetPlatform);
}

bool get isMacOs {
  if (kIsWeb) return false;
  return [
    TargetPlatform.macOS,
  ].contains(defaultTargetPlatform);
}

bool get isAndroid {
  if (kIsWeb) return false;
  return [
    TargetPlatform.android,
  ].contains(defaultTargetPlatform);
}

bool get isiOS {
  if (kIsWeb) return false;
  return [
    TargetPlatform.iOS,
  ].contains(defaultTargetPlatform);
}

bool isPasswordValid(String input) {
  return RegExp(
    r'^(?=.*?[A-z])(?=.*?[0-9]).{8,}$',
  ).hasMatch(input);
}


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
