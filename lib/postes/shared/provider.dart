import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../core/shared/providers.dart';
import '../application/posts_notifire.dart';
import '../application/posts_states.dart';
import '../infrastructure/repository/local/posts_local.dart';
import '../infrastructure/repository/remote/posts_remote.dart';
import '../infrastructure/repository/remote/remote_repository.dart';
import '../infrastructure/repository/repository.dart';
import '../presentation/logic/post_ui_logic.dart';

final postService =
    Provider<PostsService>((ref) => PostsService(ref.watch(dioProvider)));

final postRemoteRepositoryProvider = Provider<PostsRemoteDataSource>(
    (ref) => PostsRemoteDataSource(ref.watch(postService)));

final postLocalRepositoryProvider = Provider<PostsLocalService>(
    (ref) => PostsLocalService(ref.watch(isarDatabaseProvider)));

final postRepository = Provider<PostsRepository>(
  (ref) => PostsRepository(
    ref.watch(postRemoteRepositoryProvider),
    ref.watch(postLocalRepositoryProvider),
    ref.watch(internetConnectionServiceProvider),
  ),
);

final postNotifierProvider = StateNotifierProvider<PostsNotifier, PostsStates>(
    (ref) => PostsNotifier(ref.watch(postRepository)));

final postListUiLogicStateProvider = StateProvider<PostListUiLogic>((ref) {
  return PostListUiLogic(ref);
});
