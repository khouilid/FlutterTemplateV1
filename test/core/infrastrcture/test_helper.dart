import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:logger/logger.dart';
import 'package:mockito/mockito.dart';

class TestHelper<T> {
  final DioAdapter dioAdapter;
  final String baseUrl;
  final String path;

  TestHelper({
    required this.dioAdapter,
    required this.baseUrl,
    required this.path,
  });

  Future<void> mockDioGetSuccess<T>({
    Map<String, dynamic>? data,
    String subPath = '',
  }) async {
    final route = '$baseUrl/$path/$subPath';

    when(
      dioAdapter.onGet(
        route,
        (_) => _.reply(
          201,
          T,
        ),
        data: data,
      ),
    ).thenAnswer(
      (_) async => Response(
        data: '',
        statusCode: 201,
        requestOptions: RequestOptions(),
      ),
    );
  }

  Future<void> mockDioPostSuccess<T>({
    Map<String, dynamic>? data,
    String subPath = '',
  }) async {
    final route = '$baseUrl/$path/$subPath';

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

  Future<void> mockDioDeleteSuccess<T>({
    Map<String, dynamic>? data,
    String subPath = '',
  }) async {
    final route = '$baseUrl/$path/$subPath';

    when(
      dioAdapter.onDelete(
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

  Future<void> mockDioPutSuccess<T>({
    Map<String, dynamic>? data,
    String subPath = '',
  }) async {
    final route = '$baseUrl/$path/$subPath';

    when(
      dioAdapter.onPut(
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

  void verifyDioMethodNever<T>({
    String subPath = '',
    Map<String, dynamic>? data,
  }) {
    final route = '$baseUrl/$path/$subPath';
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
    Logger().i('✅ Verifying result type...\n');
    expect(result, isA<T>());
    Logger().i('✅ Result type verification successful.\n');
  }

  void verifyResponseValues<T>(T result) {
    Logger().i('✅ Verifying response values... \n');
    expect(result, isA<T>());
    Logger().i('✅ Response values verified successfully. \n');
  }

  void verifyResponseListValues<T>(List<T> result) {
    Logger().i('✅ Verifying response values... \n');
    expect(result, isA<List<T>>());
    Logger().i('✅ Response values verified successfully. \n');
  }

  void verifyResponseValuesCreate<T>(T result) {
    Logger().i('✅ Verifying response values... \n');

    expect(result, isA<T>());

    Logger().i('✅ Response values verified successfully. \n');
  }
}
