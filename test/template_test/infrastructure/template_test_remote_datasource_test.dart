import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:logger/logger.dart';
import 'package:template/template_test/infrastructure/dtos/template_test_dto.dart';
import 'package:template/template_test/infrastructure/remote/template_test_remote_datasource.dart';
import 'package:mockito/mockito.dart';
import 'package:template/core/infrastructure/helpers/logger_interceptor.dart';
import 'package:template/core/shared/providers.dart';

import '../../core/infrastrcture/test_helper.dart';

class MockDioAdapter extends Mock implements DioAdapter {}

void main() async {
  final baseUrl = dotenv.env['BASE_URL'] ?? '';

  group('Templatetest Service Tests', () {
    late TemplatetestRemoteDataSource template_testRemoteDataSource;
    late ProviderContainer container;
    late TestHelper testHelper;
    late Dio dio;
    late DioAdapter dioAdapter;

    setUp(() async {
      container = ProviderContainer();
      dio = container.read(dioProvider);

      dio.options.baseUrl = baseUrl;
      dio.interceptors.add(
        LoggingInterceptor(
          baseUrl: baseUrl,
        ),
      );

      dioAdapter = MockDioAdapter();
      testHelper = TestHelper<TemplatetestDto>(
        dioAdapter: dioAdapter,
        baseUrl: baseUrl,
        path: '/template_test',
      );
      template_testRemoteDataSource = TemplatetestRemoteDataSource(dio);
    });

    test('🧪 get template_test', () async {
      await testHelper.mockDioGetSuccess<TemplatetestDto>(
        subPath: '/1',
      );

      Logger().i('✅ Calling get template_test method...\n');
      final result = await template_testRemoteDataSource.getTemplatetestById(1);
      Logger().i('✅ GetTemplatetestById method called successfully.\n');

      testHelper.verifyDioMethodNever<String>();
      testHelper.verifyResultType<TemplatetestDto>(result);
      testHelper.verifyResponseValues<TemplatetestDto>(result);
    });

    print("--------------------------------------------------\n");

    test('🧪 get list template_test', () async {
      await testHelper.mockDioGetSuccess<TemplatetestDto>(
        subPath: '/1',
      );

      Logger().i('✅ Calling get list template_test method...\n');
      final result = await template_testRemoteDataSource.getAllTemplatetests();
      Logger().i('✅ getAllTemplatetests method called successfully.\n');

      testHelper.verifyDioMethodNever<String>();
      testHelper.verifyResultType<List<TemplatetestDto>>(result);
      testHelper.verifyResponseListValues<TemplatetestDto>(result);
    });

    print("--------------------------------------------------\n");

    test('🧪 create template_test', () async {
      await testHelper.mockDioPostSuccess<String>(
        data: TemplatetestDto.empty().toJson(),
      );

      Logger().i('✅ Calling create template_test method...\n');
      final result = await template_testRemoteDataSource
          .createTemplatetest(TemplatetestDto.empty());
      Logger().i('✅ CreateTemplatetest method called successfully.\n');

      testHelper.verifyDioMethodNever<String>(
        data: TemplatetestDto.empty().toJson(),
      );

      testHelper.verifyResultType<TemplatetestDto>(result);
      testHelper.verifyResponseValuesCreate<TemplatetestDto>(result);
    });

    print("--------------------------------------------------\n");

    test('🧪 update template_test', () async {
      await testHelper.mockDioPutSuccess<String>(
        data: TemplatetestDto.empty().toJson(),
      );

      Logger().i('✅ Calling update template_test method...\n');
      final result = await template_testRemoteDataSource
          .updateTemplatetest(TemplatetestDto.empty());
      Logger().i('✅ UpdateTemplatetest method called successfully.\n');

      testHelper.verifyDioMethodNever<String>(
        data: TemplatetestDto.empty().toJson(),
      );

      testHelper.verifyResultType<TemplatetestDto>(result);
      testHelper.verifyResponseValuesCreate<TemplatetestDto>(result);
    });

    print("--------------------------------------------------\n");

    test('🧪 delete template_test', () async {
      await testHelper.mockDioDeleteSuccess<String>(
        subPath: '/1',
      );

      Logger().i('✅ Calling delete template_test method...\n');
      final result = await template_testRemoteDataSource.deleteTemplatetest(1);
      Logger().i('✅ DeleteTemplatetest method called successfully.\n');

      testHelper.verifyDioMethodNever<String>(
        subPath: '/1',
      );

      testHelper.verifyResultType<bool>(result);
      testHelper.verifyResponseValues<bool>(result);
    });
  });
}
