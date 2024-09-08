import 'package:freezed_annotation/freezed_annotation.dart';


part 'response_create.freezed.dart';

@freezed
class ResponseCreatePostModel with _$ResponseCreatePostModel {
  const ResponseCreatePostModel._();

  const factory ResponseCreatePostModel({
    required int id,
  }) = _ResponseCreatePostModel;
}
