import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../domain/posts_model.dart';
import '../infrastructure/repository/repository.dart';
import 'posts_states.dart';

class PostsNotifier extends StateNotifier<PostsStates> {
  final PostsRepository _repository;

  PostsNotifier(this._repository) : super(const PostsStates.initial());

  void loading() => state = const PostsStates.loading();
  void success() => state = const PostsStates.success();

  Future<void> getPosts() async {
    loading();
    final result = await _repository.getPosts();
    result.fold(
      (l) => state = PostsStates.failure(l),
      (r) => state = PostsStates.dataGot(
        r.entity,
        isFresh: r.isFresh,
      ),
    );
  }

  Future<void> createPost(Posts post) async {
    loading();
    final result = await _repository.createPost(post);
    result.fold(
        (l) => PostsStates.failure(l), (r) => const PostsStates.success());
    loading();
    final resultLoad = await _repository.getPosts();
    resultLoad.fold(
      (l) => state = PostsStates.failure(l),
      (r) => state = PostsStates.dataGot(
        r.entity,
        isFresh: r.isFresh,
      ),
    );
  }
}
