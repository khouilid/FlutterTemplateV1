
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mockito/mockito.dart';

Future<void> mockDioPostSuccess<T>(
  DioAdapter dioAdapter,
  String baseUrl,
  String path, {
  Map<String, dynamic>? data,
}) async {
  final route = '$baseUrl/$path';

  when(
    dioAdapter.onPost(
      route,
      (_) => _.reply(
        200,
        T,
      ),
      data: data,
    ),
  ).thenAnswer(
    (_) async => Response(
      data: '',
      statusCode: 200,
      requestOptions: RequestOptions(),
    ),
  );
}

void verifyDioPostMethodNever<T>(
  DioAdapter dioAdapter,
  String baseUrl,
  String path, {
  Map<String, dynamic>? data,
}) {
  final route = '$baseUrl/$path';

  verifyNever(
    dioAdapter.onPost(
      route,
      (_) => _.reply(
        200,
        T,
      ),
      data: data,
    ),
  );
}

void verifyResultType<T>(T result) {
  print('✅ Verifying result type...\n');
  expect(result, isA<T>());
  print('✅ Result type verification successful.\n');
}

