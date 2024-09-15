import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:template/core/config/environment.dart';

import '../dtos/tokens_dto.dart';
import 'tokens_storage.dart';

class SecureTokensStorage implements TokensStorage {
  final FlutterSecureStorage _storage;

  SecureTokensStorage(this._storage);

  TokensDto? _cachedTokens;

  @override
  Future<TokensDto?> read() async {
    if (_cachedTokens != null) {
      return _cachedTokens;
    }
    try {
      final jsonResponse = await _storage.read(key: encryptKey);

      if (jsonResponse == null) {
        return null;
      }

      return _cachedTokens = TokensDto.fromJson(
        json.decode(jsonResponse) as Map<String, dynamic>,
      );
    } on FormatException {
      return null;
    }
  }

  @override
  Future<void> save(TokensDto tokens) {
    _cachedTokens = tokens;

    return _storage.write(
      key: encryptKey,
      value: json.encode(
        tokens.toJson(),
      ),
    );
  }

  @override
  Future<void> clear() {
    _cachedTokens = null;
    return _storage.delete(key: encryptKey);
  }
}
