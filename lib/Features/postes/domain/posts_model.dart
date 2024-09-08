import 'package:freezed_annotation/freezed_annotation.dart';

part 'posts_model.freezed.dart';

@freezed
class Posts with _$Posts {
  const Posts._();
  const factory Posts({
    int? id,
    required String title,
    required String body,
  }) = _Posts;
}
