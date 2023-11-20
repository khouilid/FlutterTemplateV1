import '../../dtos/posts_dto.dart';
import '../../dtos/response_create_post_dto.dart';
import 'posts_remote.dart';

class PostsRemoteDataSource {
  final PostsService _postsService;
  PostsRemoteDataSource(this._postsService);

  Future<List<PostsDto>> getPostsDto() => _postsService.getPosts();
  Future<ResponseCreatePostDto> createPosts(PostsDto post) => _postsService.createPost(post.toJson());
}
