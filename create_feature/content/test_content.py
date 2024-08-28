from utils import create_file
import os

def generate_test_files(parent_dir):
    test_dir_path = os.path.join("..", "test", parent_dir, "infrastructure")
    os.makedirs(test_dir_path, exist_ok=True)

    file_name_prefix = parent_dir
    file_name = f"{file_name_prefix}_remote_datasource_test.dart"
    file_path = os.path.join(test_dir_path, file_name)

    content = f"""import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:logger/logger.dart';
import 'package:template/{file_name_prefix}/infrastructure/dtos/{file_name_prefix}_dto.dart';
import 'package:template/{file_name_prefix}/infrastructure/remote/{file_name_prefix}_remote_datasource.dart';
import 'package:mockito/mockito.dart';
import 'package:template/core/infrastructure/helpers/logger_interceptor.dart';
import 'package:template/core/shared/providers.dart';

import '../../core/infrastrcture/test_helper.dart';

class MockDioAdapter extends Mock implements DioAdapter {{}}

void main() async {{
  final baseUrl = dotenv.env['BASE_URL'] ?? '';

  group('{file_name_prefix.capitalize().replace("_", "")} Service Tests', () {{
    late {file_name_prefix.capitalize().replace("_", "")}RemoteDataSource {file_name_prefix}RemoteDataSource;
    late ProviderContainer container;
    late TestHelper testHelper;
    late Dio dio;
    late DioAdapter dioAdapter;

    setUp(() async {{
      container = ProviderContainer();
      dio = container.read(dioProvider);

      dio.options.baseUrl = baseUrl;
      dio.interceptors.add(
        LoggingInterceptor(
          baseUrl: baseUrl,
        ),
      );

      dioAdapter = MockDioAdapter();
      testHelper = TestHelper<{file_name_prefix.capitalize().replace("_", "")}Dto>(
        dioAdapter: dioAdapter,
        baseUrl: baseUrl,
        path: '/{file_name_prefix}',
      );
      {file_name_prefix}RemoteDataSource = {file_name_prefix.capitalize().replace("_", "")}RemoteDataSource(dio);
    }});

    test('🧪 get {file_name_prefix}', () async {{
      await testHelper.mockDioGetSuccess<{file_name_prefix.capitalize().replace("_", "")}Dto>(
        subPath: '/1',
      );

      Logger().i('✅ Calling get {file_name_prefix} method...\\n');
      final result = await {file_name_prefix}RemoteDataSource.get{file_name_prefix.capitalize().replace("_", "")}ById(1);
      Logger().i('✅ Get{file_name_prefix.capitalize().replace("_", "")}ById method called successfully.\\n');

      testHelper.verifyDioMethodNever<String>();
      testHelper.verifyResultType<{file_name_prefix.capitalize().replace("_", "")}Dto>(result);
      testHelper.verifyResponseValues<{file_name_prefix.capitalize().replace("_", "")}Dto>(result);
    }});

    print("--------------------------------------------------\\n");

    test('🧪 get list {file_name_prefix}', () async {{
      await testHelper.mockDioGetSuccess<{file_name_prefix.capitalize().replace("_", "")}Dto>(
        subPath: '/1',
      );

      Logger().i('✅ Calling get list {file_name_prefix} method...\\n');
      final result = await {file_name_prefix}RemoteDataSource.getAll{file_name_prefix.capitalize().replace("_", "")}s();
      Logger().i('✅ getAll{file_name_prefix.capitalize().replace("_", "")}s method called successfully.\\n');

      testHelper.verifyDioMethodNever<String>();
      testHelper.verifyResultType<List<{file_name_prefix.capitalize().replace("_", "")}Dto>>(result);
      testHelper.verifyResponseListValues<{file_name_prefix.capitalize().replace("_", "")}Dto>(result);
    }});

    print("--------------------------------------------------\\n");

    test('🧪 create {file_name_prefix}', () async {{
      await testHelper.mockDioPostSuccess<String>(
        data: {file_name_prefix.capitalize().replace("_", "")}Dto.empty().toJson(),
      );

      Logger().i('✅ Calling create {file_name_prefix} method...\\n');
      final result = await {file_name_prefix}RemoteDataSource
          .create{file_name_prefix.capitalize().replace("_", "")}({file_name_prefix.capitalize().replace("_", "")}Dto.empty());
      Logger().i('✅ Create{file_name_prefix.capitalize().replace("_", "")} method called successfully.\\n');

      testHelper.verifyDioMethodNever<String>(
        data: {file_name_prefix.capitalize().replace("_", "")}Dto.empty().toJson(),
      );

      testHelper.verifyResultType<{file_name_prefix.capitalize().replace("_", "")}Dto>(result);
      testHelper.verifyResponseValuesCreate<{file_name_prefix.capitalize().replace("_", "")}Dto>(result);
    }});

    print("--------------------------------------------------\\n");

    test('🧪 update {file_name_prefix}', () async {{
      await testHelper.mockDioPutSuccess<String>(
        data: {file_name_prefix.capitalize().replace("_", "")}Dto.empty().toJson(),
      );

      Logger().i('✅ Calling update {file_name_prefix} method...\\n');
      final result = await {file_name_prefix}RemoteDataSource
          .update{file_name_prefix.capitalize().replace("_", "")}({file_name_prefix.capitalize().replace("_", "")}Dto.empty());
      Logger().i('✅ Update{file_name_prefix.capitalize().replace("_", "")} method called successfully.\\n');

      testHelper.verifyDioMethodNever<String>(
        data: {file_name_prefix.capitalize().replace("_", "")}Dto.empty().toJson(),
      );

      testHelper.verifyResultType<{file_name_prefix.capitalize().replace("_", "")}Dto>(result);
      testHelper.verifyResponseValuesCreate<{file_name_prefix.capitalize().replace("_", "")}Dto>(result);
    }});

    print("--------------------------------------------------\\n");

    test('🧪 delete {file_name_prefix}', () async {{
      await testHelper.mockDioDeleteSuccess<String>(
        subPath: '/1',
      );

      Logger().i('✅ Calling delete {file_name_prefix} method...\\n');
      final result = await {file_name_prefix}RemoteDataSource.delete{file_name_prefix.capitalize().replace("_", "")}(1);
      Logger().i('✅ Delete{file_name_prefix.capitalize().replace("_", "")} method called successfully.\\n');

      testHelper.verifyDioMethodNever<String>(
        subPath: '/1',
      );

      testHelper.verifyResultType<bool>(result);
      testHelper.verifyResponseValues<bool>(result);
    }});
  }});
}}


"""
    with open(file_path, 'w') as file:
        file.write(content)
