import 'package:freezed_annotation/freezed_annotation.dart';

part 'token.freezed.dart';

@freezed
class Token with _$Token {
  const Token._();
  const factory Token({
    required String token,
    required String expiresAt,
  }) = _Token;
}
