import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../core/infrastructure/extensions/bool_parse_extension.dart';

import 'storage/theme_storage.dart';

class SecureThemeStorage extends ThemeStorage {
  final FlutterSecureStorage _storage;

  SecureThemeStorage(this._storage);

  static const _key = 'theme_storage';
  bool? _isDarkCache;

  @override
  Future<void> clear() {
    _isDarkCache = null;
    return _storage.delete(key: _key);
  }

  @override
  Future<bool?> read() async {
    if (_isDarkCache != null) {
      return _isDarkCache;
    }
    final theme = await _storage.read(key: _key);
    if (theme == null) {
      return null;
    }
    return theme.boolParse();
  }

  @override
  Future<void> save({required bool isDark}) {
    _isDarkCache = isDark;
    return _storage.write(key: _key, value: isDark.toString());
  }
}
