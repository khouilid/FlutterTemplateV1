import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import '../exceptions/dio_exception.dart' as exp;
import '../extensions/dio_extensions.dart';
import '../remote_response.dart';

class RemoteServiceHelper {
  Future<T> withoutRemoteResponse<T>(
    Future<Response<dynamic>> function, [
    T Function(dynamic response)? mapFunction,
  ]) async =>
      await _handleResponse<T, T>(function, mapFunction) as T;

  Future<RemoteResponse<T>> withRemoteResponse<T>(
    Future<Response<dynamic>> function,
    T Function(dynamic response) mapFunction,
  ) async {
    try {
      final response = await function;
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return RemoteResponse.withData(mapFunction(response.data));
      } else {
        throw exp.DioException(
          code: response.statusCode,
          message: response.statusMessage,
        );
      }
    } on DioException catch (e, s) {
      Logger().d(s);

      if (e.isNoConnectionError) {
        return const RemoteResponse.noConnection();
      } else if (e.response != null) {
        throw exp.DioException(
          code: e.response?.statusCode,
          message: e.response?.statusMessage,
        );
      } else {
        rethrow;
      }
    }
  }

  Future<Object?> _handleResponse<T, R>(
    Future<Response<dynamic>> function,
    R Function(dynamic response)? mapFunction, {
    bool throwError = true,
  }) async {
    try {
      final response = await function;

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        if (throwError) {
          if (mapFunction != null) {
            return mapFunction(response.data);
          } else {
            return unit;
          }
        } else {
          if (mapFunction != null) {
            return RemoteResponse.withData(mapFunction(response.data));
          } else {
            return const RemoteResponse.withData(unit);
          }
        }
      } else {
        print("eeeeeeeeeee");

        // Check for server error 500
        if (response.statusCode == 500) {
          print(response.data);
          throw exp.DioException(
            code: response.statusCode,
            message: response.data.toString(),
            //error: response.data, // Include response data in the error
          );
        } else {
          throw exp.DioException(
            code: response.statusCode,
            message: response.statusMessage,
          );
        }
      }
    } catch (e, s) {
      Logger().i(e);
      print(e);
      Logger().d(s);

      if (e is DioError) {
        print(e.response?.data);
        if (e.isNoConnectionError) {
          if (throwError) {
            throw exp.DioException(
              code: 4000,
              message: 'No Internet Connection',
            );
          } else {
            return const RemoteResponse.noConnection();
          }
        } else if (e.response != null) {
          throw exp.DioException(
            code: e.response?.statusCode,
            message: e.response?.statusMessage,
          );
        } else {
          rethrow;
        }
      } else if (e is SocketException) {
        throw exp.DioException(
          code: e.hashCode,
          message: "SocketException",
        );
      }
    }
    return null;
  }
}
