
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:isar/isar.dart';
import 'package:logger/logger.dart';
import 'package:template/core/domain/failure.dart';
import 'package:template/core/infrastructure/database/isar_database.dart';
import 'package:template/core/infrastructure/helpers/repository_helper.dart';


import '../../user/domain/user_domain.dart';
import '../../user/infrastructure/user_storage/user_storage.dart';

import '../domain/auth_response.dart';
import '../domain/tokens.dart';
import 'auth_remote_service.dart';
import 'tokens_storage/tokens_storage.dart';

class Authenticator with RepositoryHelper {
  final AuthRemoteService _remoteService;
  final UserStorage _userStorage;
  final TokensStorage _tokensStorage;
  final IsarDatabase _isarDatabase;

  const Authenticator(
    this._remoteService,
    this._userStorage,
    this._tokensStorage,
    this._isarDatabase,
  );

  Future<User?> getSignedInUser() async {
    try {
      final tokensFromStorage = await getTokens();
      if (tokensFromStorage == null) {
        await _userStorage.clear();
        return null;
      }
      final expiresAt = DateTime.parse(tokensFromStorage.access.expiresAt);

      final expired = DateTime.now().isAfter(expiresAt);

      if (expired) {
        await signOut();
        return null;
      }

      final before2Days = expiresAt.isBefore(
        DateTime.now().subtract(
          const Duration(days: 2),
        ),
      );

      if (before2Days) {
        final failureOrSuccess =
            await refreshToken(tokensFromStorage.refresh.token);
        return failureOrSuccess.fold(
          (l) => l.maybeMap(
            server: (_) async {
              if (_.code == 4000) {
                final user = await _userStorage.read();

                return user?.toDomain();
              }
              return null;
            },
            orElse: () => null,
          ),
          (r) async {
            final user = await _userStorage.read();
            return user?.toDomain();
          },
        );
      } else {
        final user = await _userStorage.read();
        return user?.toDomain();
      }
    } on PlatformException {
      return null;
    }
  }

  Future<Tokens?> getTokens() async {
    try {
      final tokensDto = await _tokensStorage.read();
      print(tokensDto);
      if (tokensDto != null) {
        return tokensDto.toDomain();
      }
      return null;
    } on PlatformException {
      return null;
    }
  }

  FutureEitherFailureOr<AuthResponse> signIn(
    String email,
    String password,
  ) =>
      handleData(
        _remoteService.signIn(email, password),
        (_) async {
          print(_.tokens);
          await _tokensStorage.save(_.tokens);
          await _userStorage.save(_.user);
          return _.toDomain();
        },
      );

  FutureEitherFailureOr<Unit> refreshToken(
    String token,
  ) =>
      handleData(
        _remoteService.refreshToken(token),
        (tokensDto) async {
          await _tokensStorage.save(tokensDto);
          return unit;
        },
      );

  FutureEitherFailureOr<Unit> signOut() async {
    try {
      await _userStorage.clear();
      await _tokensStorage.clear();

      if (kIsWeb) {
        return right(unit);
      }

      // await _isarDatabase.isar.writeTxn(
      //   () => _isarDatabase.isar.clear(),
      // );

      return right(unit);
    } on PlatformException {
      return left(const Failure.storage());
    } catch (e) {
      if (e is IsarError) {
        return left(const Failure.storage());
      }
      rethrow;
    }
  }
}
