import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/posts_model.dart';
import '../isar/post_isar.dart';
part 'posts_dto.freezed.dart';
part 'posts_dto.g.dart';

@freezed
class PostsDto with _$PostsDto {
  const PostsDto._();
  const factory PostsDto({
    int? id,
    required String title,
    required String body,
  }) = _PostsDto;



  factory PostsDto.fromJson(Map<String, dynamic> json) => _$PostsDtoFromJson(json);


  factory PostsDto.fromDomain(Posts posts) {
    return PostsDto(
      id: posts.id,
      title: posts.title,
      body: posts.body,
    );
  }

  Posts toDomain() {
    return Posts(
      id: id,
      title: title,
      body: body,
    );
  }

  factory PostsDto.fromIsar(PostIsar posts) {
    return PostsDto(
      id: posts.id,
      title: posts.title,
      body: posts.body,
    );
  }

  PostIsar toIsar() => PostIsar()
    ..id = id!
    ..title = title
    ..body = body;
    
}
