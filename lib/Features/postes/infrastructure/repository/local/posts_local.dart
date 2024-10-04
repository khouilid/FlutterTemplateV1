
import "../../../../../core/infrastructure/database/local_database.dart";
import 'package:template/Features/postes/infrastructure/dtos/posts_dto.dart';

class PostsLocalService {
  final AppDatabase _database;

  PostsLocalService(this._database);

  List<PostsDto> _cachedPosts = [];

  Future<List<PostsDto>> getPosts() async {
    // if (_cachedPosts.isNotEmpty) {
    //   return _cachedPosts;
    // }
    // final postIsar = await _database.isar.postIsars.where().findAll();
    // return postIsar.map((e) => PostsDto.fromIsar(e)).toList();
    return [];
  }

  Future<void> upsertPost(List<PostsDto> posts) async {
    // _cachedPosts = posts;
    // final postIsar = posts.map((e) => e.toIsar()).toList();
    // await _database.isar.writeTxn(
    //   () async {
    //     await _database.isar.postIsars.putAll(postIsar);
    //   },
    // );
  }

  Future<int> addPost(PostsDto post) {
    // _cachedPosts.add(post);
    // final postIsar = post.toIsar();
    // return _database.isar.writeTxn(
    //   () => _database.isar.postIsars.put(postIsar),
    // );
    return Future.value(0);
  }

  Future<int> deletePost() async {
    // final ids = _cachedPosts.map((e) => e.toIsar().isarId).toList();
    // _cachedPosts = [];
    // return _database.isar
    //     .writeTxn(() => _database.isar.postIsars.deleteAll(ids));
    return 0;
  }
}
