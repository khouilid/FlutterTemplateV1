import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../core/presentation/utils/functions.dart';
import 'locale_storage.dart';

class SecureLocaleStorage extends LocaleStorage {
  final FlutterSecureStorage _storage;

  SecureLocaleStorage(this._storage);

  static const _key = '4fiamane_locale';

  Locale? _cachedLocale;

  @override
  Future<void> clear() {
    _cachedLocale = null;
    return _storage.delete(
      key: _key,
    );
  }

  @override
  Future<Locale?> read() async {
    try {
      if (_cachedLocale != null) {
        return _cachedLocale;
      }
      final languageCode = await _storage.read(
        key: _key,
      );
      if (languageCode == null) {
        return null;
      }
      return Locale(languageCode);
    } on PlatformException {
      return null;
    }
  }

  @override
  Future<void> save(Locale locale) async {
    _cachedLocale = locale;
    if (isMacOs) {
      await _storage.delete(key: _key);
    }
    return _storage.write(
      key: _key,
      value: locale.languageCode,
    );
  }
}
