
import 'package:dio/dio.dart';
import 'package:template/core/infrastructure/helpers/remote_service_helper.dart';

class NotificationsRemoteDataSource extends RemoteServiceHelper {
  final Dio _dio;

  NotificationsRemoteDataSource(this._dio);

// update fcm token
  Future<void> updateFcmToken(String token) async {
    final response = await _dio.post(
      '/User/UpdateFCMToken',
      data: {
        'fcm_token': token,
      },
    );
    return response.data;
  }
}
