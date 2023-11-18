
import 'package:dio/dio.dart';

class LoggingInterceptor extends InterceptorsWrapper {
  int maxCharactersPerLine = 200;
  String baseUrl;

  LoggingInterceptor({required this.baseUrl});

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    print("--> ${options.method} ${baseUrl + options.path}");
    print("Headers: ${options.headers}");
    print("Query Parameters: ${options.queryParameters}");
    print("Body: ${options.data}");
    print("<-- END HTTP");

    return super.onRequest(options, handler);
  }

  @override
  Future<void> onResponse(Response response, ResponseInterceptorHandler handler) async {
    print(
      "<-- ${response.statusCode} ${response.requestOptions.method} ${response.requestOptions.path}",
    );

    final String responseAsString = response.data.toString();

    if (responseAsString.length > maxCharactersPerLine) {
      final int iterations = (responseAsString.length / maxCharactersPerLine).floor();
      for (int i = 0; i <= iterations; i++) {
        int endingIndex = i * maxCharactersPerLine + maxCharactersPerLine;
        if (endingIndex > responseAsString.length) {
          endingIndex = responseAsString.length;
        }
        print(responseAsString.substring(i * maxCharactersPerLine, endingIndex));
      }
    } else {
      print(response.data);
    }

    print("<-- END HTTP");
    return super.onResponse(response, handler);
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    print("ERROR[${err.response != null ? err.response?.statusCode : err}] => PATH: ${err.requestOptions.path}");
    print("ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}");
    return super.onError(err, handler);
  }
}
