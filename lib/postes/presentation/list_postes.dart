import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../core/presentation/managers/color_manager.dart';
import '../application/posts_states.dart';
import '../shared/provider.dart';

@RoutePage()
class PostsListScreen extends ConsumerStatefulWidget {
  const PostsListScreen({
    super.key,
  });

  @override
  ConsumerState createState() => _PostsListScreenState();
}

class _PostsListScreenState extends ConsumerState<PostsListScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(postNotifierProvider.notifier).getPosts());
  }

  Future<void> _onRefresh() async => Future.microtask(
      () => ref.read(postNotifierProvider.notifier).getPosts());

  @override
  Widget build(BuildContext context) {
    ref.listen<PostsStates>(
      postNotifierProvider,
      (previous, next) {
        next.maybeMap(
            orElse: () {},
            failure: (_) async {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(_.failure.message ?? "Something Went Wrong"),
                ),
              );
            },
            dataGot: (_) async {
              if (_.isFresh == false) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("This data from local"),
                  ),
                );
              }
            },
            success: (_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Post Created Successfully"),
                ),
              );
            });
      },
    );

    final state = ref.watch(postNotifierProvider);
    return Scaffold(
        key: Key("post_list_scaffold"),
        appBar: AppBar(
          title: const Text('Posts'),
        ),
        body: state.maybeMap(
          orElse: () => const Center(
            child: CircularProgressIndicator(
              color: AppColors.chateauGreen,
            ),
          ),
          loading: (_) => const Center(
            child: CircularProgressIndicator(
              color: AppColors.chateauGreen,
            ),
          ),
          dataGot: (_) => RefreshIndicator(
            onRefresh: _onRefresh,
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: _.list.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(_.list[index].title),
                        subtitle: Text(_.list[index].body),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => ref.read(postListUiLogicStateProvider).createPost(),
          child: const Icon(Icons.add),
        ));
  }
}
