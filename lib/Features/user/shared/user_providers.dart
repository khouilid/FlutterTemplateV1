
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template/core/shared/providers.dart';
import "../application/user_notifire.dart";
import '../application/user_states.dart';
import '../domain/user_domain.dart';
import '../infrastructure/remote/user_remote_datasource.dart';

import '../infrastructure/repository/user_repository.dart';
import '../infrastructure/user_storage/secure_user_storage.dart';
import '../infrastructure/user_storage/user_storage.dart';

final secureUserStorageProvider = Provider<UserStorage>(
  (ref) => SecureUserStorage(
    ref.watch(flutterSecureStorageProvider),
  ),
);

final userRemoteRepositoryProvider = Provider<UserRemoteDataSource>(
  (ref) => UserRemoteDataSource(ref.watch(dioProvider)),
);

final userRepositoryProvider = Provider<UserRepository>(
  (ref) => UserRepository(
    ref.watch(userRemoteRepositoryProvider),
  ),
);

final userNotifierProvider =
    StateNotifierProvider<UserStateNotifier, UserState>(
  (ref) => UserStateNotifier(ref.watch(userRepositoryProvider)),
);

final sideMenuStateProvider = StateProvider<bool>((ref) => false);

final userProvider = StateProvider<User>(
  (ref) => User.empty(),
);

final userProviderEdit = StateProvider<User>(
  (ref) => User.empty(),
);

final resizeToAvoidBottomInsetProvider = StateProvider<bool?>(
  (ref) => null,
);
