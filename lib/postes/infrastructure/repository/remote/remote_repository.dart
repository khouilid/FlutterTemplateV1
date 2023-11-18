import 'package:dio/dio.dart';
import '../../../../core/infrastructure/helpers/remote_service_helper.dart';
import '../../dtos/posts_dto.dart';

class PostsRemoteDataSource extends RemoteServiceHelper {
  final Dio _dio;

  PostsRemoteDataSource(this._dio);

  Future<List<PostsDto>> getPostsDto() async =>
      withoutRemoteResponse(_dio.get("/posts"), (_) {
        return (_ as List).map((e) => PostsDto.fromJson(e)).toList();
      });

  Future<int> createPosts(PostsDto postsDto) async =>
      withoutRemoteResponse(_dio.post("/posts"), (_) {
        return  _["id"] as int;
      });
}
