import 'package:freezed_annotation/freezed_annotation.dart';
import '../../core/domain/failure.dart';
import '../domain/posts_model.dart';
part 'posts_states.freezed.dart';

@freezed
class PostsStates with _$PostsStates {
  const PostsStates._();
  const factory PostsStates.initial() = _Initial;
  const factory PostsStates.loading() = _Loading;
  const factory PostsStates.success() = _Success;
  const factory PostsStates.empty() = _Empty;
  const factory PostsStates.dataGot(
    List<Posts> list, {
    required bool isFresh,
  }) = _DataGot;
  const factory PostsStates.failure(Failure failure) = _Failure;
}
