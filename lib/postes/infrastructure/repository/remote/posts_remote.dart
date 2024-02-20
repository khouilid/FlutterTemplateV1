import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../dtos/posts_dto.dart';
import '/postes/infrastructure/dtos/response_create_post_dto.dart';

part 'posts_remote.g.dart';

@RestApi()
abstract class PostsService {
  factory PostsService(Dio dio) = _PostsService;

  @GET('/posts')
  Future<List<PostsDto>> getPosts();

  @POST('/posts')
  Future<ResponseCreatePostDto> createPost(
      @Body() Map<String, dynamic> example);

  @PUT('/posts/{id}')
  Future<PostsDto> updatePost(@Path() int id, @Body() PostsDto example);

  @DELETE('/posts/{id}')
  Future<void> deletePost(@Path() int id);
}
