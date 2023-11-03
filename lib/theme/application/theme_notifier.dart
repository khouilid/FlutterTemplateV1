import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../infrastructure/theme_repository.dart';

class ThemeNotifier extends StateNotifier<ThemeMode> {
  final ThemeRepository _repository;
  ThemeNotifier(this._repository) : super(ThemeMode.system);

  Future<void> getThemeMode() async =>
      state = await _repository.getThemeFromStorage();

  Future<void> setThemeMode(ThemeMode mode) async {
    state = mode;
    await _repository.saveTheme(mode);
  }
}
