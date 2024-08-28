import 'dart:io';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:template/core/infrastructure/helpers/repository_helper.dart';
import '../domain/app_update_status_model.dart';
import 'app_version_remote_datasource.dart';

class AppVersionRepository with RepositoryHelper {
  const AppVersionRepository(
    this._appVersionRemoteDataSource,
  );

  final AppVersionRemoteDataSource _appVersionRemoteDataSource;

  FutureEitherFailureOr<AppUpdateStatusModel> checkForUpdate() async {
    final packageInfo = await PackageInfo.fromPlatform();
    return handleData(
        _appVersionRemoteDataSource.getAppVersion(
            Platform.operatingSystem, packageInfo.packageName), (data) async {
      final appVersion = data.toDomain();
      return AppUpdateStatusModel(
        updateAvailable: packageInfo.version != appVersion.version,
        optional: appVersion.optional,
        appLink: appVersion.appLink,
        description: appVersion.description,
        platform: appVersion.platform,
      );
    });
  }
}
