import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/response_create.dart';

part 'response_create_post_dto.freezed.dart';
part 'response_create_post_dto.g.dart';

@freezed
class ResponseCreatePostDto with _$ResponseCreatePostDto {
  const ResponseCreatePostDto._();
  const factory ResponseCreatePostDto({@JsonKey(name: 'id') int? id}) =
      _ResponseCreatePostDto;

  factory ResponseCreatePostDto.fromJson(Map<String, dynamic> json) =>
      _$ResponseCreatePostDtoFromJson(json);

  factory ResponseCreatePostDto.fromDomain(
      ResponseCreatePostModel responseCreatePostModel) {
    return ResponseCreatePostDto(
      id: responseCreatePostModel.id,
    );
  }

  ResponseCreatePostModel toDomain() {
    return ResponseCreatePostModel(
      id: id ?? -1,
    );
  }
}
