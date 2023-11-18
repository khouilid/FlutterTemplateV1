import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mockito/mockito.dart';
import 'package:template/core/config/environment.dart';
import 'package:template/core/infrastructure/helpers/logger_interceptor.dart';
import 'package:template/core/shared/providers.dart';
import 'package:template/postes/infrastructure/dtos/posts_dto.dart';
import 'package:template/postes/infrastructure/repository/remote/remote_repository.dart';

import '../../core/infrastrcture/test_helper.dart';

class MockDioAdapter extends Mock implements DioAdapter {}

void main() async {
  await dotenv.load(fileName: fileName());
  final baseUrl = dotenv.env['BASE_URL'] ?? '';

  group('Post Service Tests', () {
    late PostsRemoteDataSource postsRemoteDataSource;
    late ProviderContainer container;
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
      postsRemoteDataSource = PostsRemoteDataSource(dio);
    });

    test('🧪 get post', () async {
      await mockDioPostSuccess<String>(
        dioAdapter,
        baseUrl,
        "/posts",
      );

      print('✅ Calling signIn method...\n');
      final result = await postsRemoteDataSource.getPostsDto();
      print('✅ SignIn method called successfully.\n');

      verifyDioPostMethodNever<String>(
        dioAdapter,
        baseUrl,
        "/posts",
      );

      verifyResultType<List<PostsDto>>(result);
      _verifyResponseValues<List<PostsDto>>(result);
    });

    print("--------------------------------------------------\n");

    test('🧪 create post', () async {
      await mockDioPostSuccess<String>(
        dioAdapter,
        baseUrl,
        "/posts",
      );

      print('✅ Calling signIn method...\n');
      final result = await postsRemoteDataSource.createPosts(PostsDto(title: "title test", body: "body test"));
      print('✅ SignIn method called successfully.\n');

      verifyDioPostMethodNever<String>(
        dioAdapter,
        baseUrl,
        "/posts",
      );

      verifyResultType<int>(result);
      _verifyResponseValuesCreate<int>(result);
    });
  });
}

void _verifyResponseValues<T>(List<PostsDto> result) {
  print('✅ Verifying response values... \n');
  expect(result, isA<List<PostsDto>>());
  print('✅ Response values verified successfully. \n');
}

void _verifyResponseValuesCreate<T>(int result) {
  print('✅ Verifying response values... \n');
  expect(result, isA<int>());
  print('✅ Response values verified successfully. \n');
}
