import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/shared/providers.dart';
import '../application/theme_notifier.dart';
import '../infrastructure/secure_theme_storage.dart';
import '../infrastructure/storage/theme_storage.dart';
import '../infrastructure/theme_repository.dart';

final themeStorageProvider = Provider<ThemeStorage>(
  (ref) => SecureThemeStorage(
    ref.watch(flutterSecureStorageProvider),
  ),
);

final themeRepositoryProvider = Provider<ThemeRepository>(
  (ref) => ThemeRepository(
    ref.watch(themeStorageProvider),
  ),
);

final themeNotifierProvider =
    StateNotifierProvider.autoDispose<ThemeNotifier, ThemeMode>(
  (ref) => ThemeNotifier(
    ref.watch(themeRepositoryProvider),
  ),
);
