import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../core/shared/providers.dart';
import '../application/localization_notifier.dart';
import '../infrastructure/localization_repository.dart';
import '../infrastructure/storage/locale_storage.dart';
import '../infrastructure/storage/secure_locale_storage.dart';




final localeStorageProvider = Provider<LocaleStorage>(
  (ref) => SecureLocaleStorage(
    ref.watch(flutterSecureStorageProvider),
  ),
);

final localizationRepositoryProvider = Provider<LocalizationRepository>(
  (ref) => LocalizationRepository(
      ref.watch(localeStorageProvider),
    ),
);

final localizationNotifierProvider =
    StateNotifierProvider<LocalizationNotifier, Locale>(
  (ref) => LocalizationNotifier(
    ref.watch(localizationRepositoryProvider),
  ),
);
