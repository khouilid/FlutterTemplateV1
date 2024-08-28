import 'package:logger/logger.dart';
import 'package:dio/dio.dart';
import 'package:template/app_update/infrastructure/dto/app_version_dto.dart';
import 'package:template/core/infrastructure/helpers/remote_service_helper.dart';

class AppVersionRemoteDataSource extends RemoteServiceHelper {
  final Dio _dio;

  AppVersionRemoteDataSource(this._dio);

  Future<AppVersionDto> getAppVersion(String platform, String appName) async {
    return withoutRemoteResponse(
      _dio.get(
        "API_TO_GET_NEW_VERSION",
      ),
      (response) {
        Logger().i(response.data);
        return AppVersionDto.fromJson(response.data as Map<String, dynamic>);
      },
    );
  }
}
