import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../infrastructure/database/isar_database.dart';
import '../infrastructure/helpers/internet_connection.dart';
import '../presentation/routes/app_router.dart';

final flutterSecureStorageProvider = Provider<FlutterSecureStorage>(
  (ref) => const FlutterSecureStorage(),
);

final isarDatabaseProvider = Provider<IsarDatabase>(
  (ref) => IsarDatabase(),
);

final dioProvider = Provider<Dio>(
  (ref) => Dio(),
);

final splashStateProvider = StateProvider<bool>(
  (ref) => false,
);

final appRouterProvider = Provider<AppRouter>(
  (ref) => AppRouter(),
);

final isCloseDialogOpenProvider = StateProvider<bool>(
  (ref) => false,
);

final internetConnectivityProvider = Provider<Connectivity>((ref) => Connectivity());

final internetConnectionServiceProvider =
    Provider<InternetConnectionService>((ref) => InternetConnectionService(ref.watch(internetConnectivityProvider)));
