import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../infrastructure/database/isar_database.dart';
import '../infrastructure/helpers/internet_connection.dart';
import '../presentation/routes/app_router.dart';

/// this is the flutter secure storage provider that we created in the [flutter_secure_storage_provider.dart] file.
final flutterSecureStorageProvider = Provider<FlutterSecureStorage>(
  (ref) => const FlutterSecureStorage(),
);

/// this is the isar database provider that we created in the [isar_database.dart] file.
final isarDatabaseProvider = Provider<IsarDatabase>(
  (ref) => IsarDatabase(),
);

/// this is the dio provider that we created in the [dio_provider.dart] file.
final dioProvider = Provider<Dio>(
  (ref) => Dio(),
);

/// this is the splash state provider that we created in the [splash_provider.dart] file.
final splashStateProvider = StateProvider<bool>(
  (ref) => false,
);

/// this is the app router that we created in the [app_router.dart] file.
final appRouterProvider = Provider<AppRouter>(
  (ref) => AppRouter(),
);

/// this is the internet connectivity provider that we created in the [internet_connection.dart] file.
final internetConnectivityProvider =
    Provider<Connectivity>((ref) => Connectivity());

/// this is the internet connection service provider that we created in the [internet_connection.dart] file.
final internetConnectionServiceProvider = Provider<InternetConnectionService>(
    (ref) =>
        InternetConnectionService(ref.watch(internetConnectivityProvider)));
