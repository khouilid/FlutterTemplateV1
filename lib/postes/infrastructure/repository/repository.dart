import '../../../core/domain/fresh.dart';
import '../../../core/infrastructure/helpers/internet_connection.dart';
import '../../../core/infrastructure/helpers/repository_helper.dart';
import '../../domain/posts_model.dart';
import '../dtos/posts_dto.dart';
import 'local/posts_local.dart';
import 'remote/remote_repository.dart';

class PostsRepository with RepositoryHelper {
  final PostsLocalService _postsLocalService;
  final PostsRemoteDataSource _postsRemoteDataSource;
  final InternetConnectionService _internetConnectionService;

  PostsRepository(
    this._postsRemoteDataSource,
    this._postsLocalService,
    this._internetConnectionService,
  );

  FutureEitherFailureOrFresh<List<Posts>> getPosts() async => handleData(
      _fromRemoteToFresh(),
      (_) =>
          Future.value(_.isFresh ? Fresh.yes(_.entity) : Fresh.no(_.entity)));

  FutureEitherFailureOr<Posts> createPost(Posts posts) async =>
      handleData(_postsRemoteDataSource.createPosts(PostsDto.fromDomain(posts)),
          (data) async {
        return posts;
      });

  Future<Fresh<List<Posts>>> _fromRemoteToFresh() async =>
      _internetConnectionService.when<Fresh<List<Posts>>>(
        onData: () async {
          final List<PostsDto> postsDto =
              await _postsRemoteDataSource.getPostsDto();
          await _postsLocalService.deletePost();
          await _postsLocalService.upsertPost(postsDto);
          final posts = postsDto.map((e) => e.toDomain()).toList();
          return Fresh.yes(posts);
        },
        onError: () async {
          final postsDto = await _postsLocalService.getPosts();
          final posts = postsDto.map((e) => e.toDomain()).toList();
          return Fresh.no(posts);
        },
      );
}
