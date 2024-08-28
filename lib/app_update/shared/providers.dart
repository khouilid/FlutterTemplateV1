import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template/core/shared/providers.dart';
import '../application/app_update_notifier.dart';
import '../infrastructure/app_version_remote_datasource.dart';
import '../infrastructure/app_version_repository.dart';


final appUpdateRemoteDataSourceProvider = Provider<AppVersionRemoteDataSource>(
    (ref) => AppVersionRemoteDataSource(ref.read(dioProvider)));

final appUpddateRepositoryProvider = Provider<AppVersionRepository>(
    (ref) => AppVersionRepository(ref.read(appUpdateRemoteDataSourceProvider)));

final appUpdateNotifierProvider =
    StateNotifierProvider<AppUpdateNotifier, AppUpdateState>(
        (ref) => AppUpdateNotifier(ref.read(appUpddateRepositoryProvider)));
