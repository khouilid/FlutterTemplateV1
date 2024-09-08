import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/token.dart';

part 'token_dto.freezed.dart';
part 'token_dto.g.dart';

@freezed
class TokenDto with _$TokenDto {
  const TokenDto._();
  const factory TokenDto({
    required String token,
    @JsonKey(name: 'expires') required String expiresAt,
  }) = _TokenDto;

  factory TokenDto.fromJson(Map<String, dynamic> json) =>
      _$TokenDtoFromJson(json);

  factory TokenDto.fromDomain(Token token) => TokenDto(
        token: token.token,
        expiresAt: token.expiresAt,
      );

  Token toDomain() => Token(token: token, expiresAt: expiresAt);
}
