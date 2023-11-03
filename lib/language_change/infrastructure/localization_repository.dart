import 'package:flutter/material.dart';

import 'storage/locale_storage.dart';

class LocalizationRepository {
  final LocaleStorage _localeStorage;

  const LocalizationRepository(this._localeStorage);

  Future<Locale?> getLocale() {
    return _localeStorage.read();
  }

  Future<void> setLocale(Locale locale) async {
    await _localeStorage.save(locale);
  }
}
