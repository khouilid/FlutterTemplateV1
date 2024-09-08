import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template/core/shared/providers.dart';
import '../../user/shared/user_providers.dart';
import '../application/auth_notifier.dart';
import '../application/auth_states.dart';
import '../infrastructure/auth_remote_service.dart';
import '../infrastructure/authenticator.dart';
import '../infrastructure/tokens_storage/secure_tokens_storage.dart';
import '../infrastructure/tokens_storage/tokens_storage.dart';

final secureTokensStorageProvider = Provider<TokensStorage>(
  (ref) => SecureTokensStorage(ref.watch(flutterSecureStorageProvider)),
);

final remoteServiceProvider = Provider<AuthRemoteService>(
  (ref) => AuthRemoteService(
    ref.watch(dioProvider),
  ),
);

final authenticatorProvider = Provider<Authenticator>(
  (ref) => Authenticator(
      ref.watch(remoteServiceProvider),
      ref.watch(secureUserStorageProvider),
      ref.watch(secureTokensStorageProvider),
      ref.watch(isarDatabaseProvider)),
);

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(
    ref.watch(authenticatorProvider),
  ),
);
