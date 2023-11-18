import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../dtos/posts_dto.dart';
part 'posts_remote.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com")
abstract class PostsService {
  factory PostsService(Dio dio) = _PostsService;

  @GET('/posts')
  Future<List<PostsDto>> getPosts();

  @POST('/posts')
  Future<PostsDto> createPost(@Body() PostsDto example);

  @PUT('/posts/{id}')
  Future<PostsDto> updatePost(@Path() int id, @Body() PostsDto example);

  @DELETE('/posts/{id}')
  Future<void> deletePost(@Path() int id);
}
