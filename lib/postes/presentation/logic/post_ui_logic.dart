import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/posts_model.dart';
import '../../shared/provider.dart';

class PostListUiLogic {
  final Ref ref;

  PostListUiLogic(this.ref);

  createPost({String title = "title", String body = "body"}) async {

    await ref
        .read(postNotifierProvider.notifier)
        .createPost(Posts(title: title, body: body));
      
  }
}
