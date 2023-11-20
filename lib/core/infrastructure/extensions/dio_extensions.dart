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
