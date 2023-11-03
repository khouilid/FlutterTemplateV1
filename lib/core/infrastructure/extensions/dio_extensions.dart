import 'dart:io';

import 'package:dio/dio.dart';

extension DioErrorX on DioError {
  bool get isNoConnectionError {
    return (type == DioErrorType.connectionError ||
            type == DioErrorType.connectionTimeout ||
            type == DioErrorType.unknown ||
            type == DioErrorType.receiveTimeout ||
            type == DioErrorType.sendTimeout) &&
        error is SocketException;
  }
}
