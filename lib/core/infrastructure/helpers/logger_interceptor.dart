import 'package:dio/dio.dart';
import 'package:logger/logger.dart';



/// [LoggingInterceptor] A class that logs Dio HTTP request and response data.
/// to can track the request and response data.
class LoggingInterceptor extends InterceptorsWrapper {
  int maxCharactersPerLine = 200;
  String baseUrl;

  LoggingInterceptor({required this.baseUrl});

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    Logger().d(
      "HTTP On Request ${options.method}\nBase : ${options.baseUrl}\nPath : ${options.path} \nOptions : on Request \nBody : ${options.data} \nHeaders : ${options.headers} \nQuery Parameters: ${options.queryParameters}",
    );

    return super.onRequest(options, handler);
  }

  @override
  Future<void> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    Logger().d(
      "HTTP On Response ${response.requestOptions.method}\nStatusCode ${response.statusCode}\nPath ${response.requestOptions.path}",
    );
    return super.onResponse(response, handler);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    Logger().e(
      "ERROR[${err.response != null ? err.response?.statusCode : err}] => PATH: ${err.requestOptions.path}",
    );

    Logger().e(
      "ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}",
    );

    return super.onError(err, handler);
  }
}
