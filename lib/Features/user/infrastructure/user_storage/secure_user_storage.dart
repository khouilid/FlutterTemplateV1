import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:template/core/config/environment.dart';

import '../dtos/user_dto.dart';
import 'user_storage.dart';

class SecureUserStorage implements UserStorage {
  final FlutterSecureStorage _storage;

  SecureUserStorage(this._storage);

  UserDto? _cachedUser;

  @override
  Future<UserDto?> read() async {
    if (_cachedUser != null) {
      return _cachedUser;
    }
    final jsonResponse = await _storage.read(key: encryptKey);

    if (jsonResponse == null) {
      return null;
    }

    try {
      return _cachedUser = UserDto.fromJson(
        json.decode(jsonResponse) as Map<String, dynamic>,
      );
    } on FormatException {
      return null;
    }
  }

  @override
  Future<void> save(UserDto user) async {
    _cachedUser = user;
    await clear();
    await _storage.write(
      key: encryptKey,
      value: json.encode(user.toJson()),
    );
  }

  @override
  Future<void> clear() {
    _cachedUser = null;
    return _storage.delete(key: encryptKey);
  }
}
