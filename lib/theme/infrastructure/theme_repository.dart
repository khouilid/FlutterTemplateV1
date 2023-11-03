import 'package:flutter/material.dart';

import 'storage/theme_storage.dart';

class ThemeRepository {
  final ThemeStorage _storage;

  ThemeRepository(this._storage);

  Future<ThemeMode> getThemeFromStorage() async {
    final themeMode = await _storage.read();
    if (themeMode == null) {
      return ThemeMode.system;
    } else {
      if (themeMode) {
        return ThemeMode.dark;
      } else {
        return ThemeMode.light;
      }
    }
  }


  Future<void> saveTheme(ThemeMode mode) async {
    switch (mode) {
      case ThemeMode.dark:
        await _storage.save(isDark: true);
      case ThemeMode.light:
        await _storage.save(isDark: false);
      default:
        await _storage.clear();
        break;
    }
  }
}
