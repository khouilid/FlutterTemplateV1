import 'dart:io';

import 'package:dio/dio.dart';

extension DioErrorX on DioException {
  bool get isNoConnectionError {
    return (type == DioExceptionType.connectionError ||
            type == DioExceptionType.connectionTimeout ||
            type == DioExceptionType.unknown ||
            type == DioExceptionType.receiveTimeout ||
            type == DioExceptionType.sendTimeout) &&
        error is SocketException;
  }
}

extension FormDataExtension on FormData {
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    for (final element in fields) {
      data[element.key] = element.value;
    }
    return data;
  }
}

extension MapExtension on Map<String, String> {
  FormData toFormData() {
    final FormData formData = FormData();
    forEach((key, value) {
      formData.fields.add(MapEntry(key, value));
    });
    return formData;
  }
}
