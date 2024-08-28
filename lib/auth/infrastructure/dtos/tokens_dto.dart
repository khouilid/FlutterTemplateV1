import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/tokens.dart';
import 'token_dto.dart';

part 'tokens_dto.freezed.dart';
part 'tokens_dto.g.dart';

@freezed
class TokensDto with _$TokensDto {
  const TokensDto._();
  const factory TokensDto({
    required TokenDto access,
    required TokenDto refresh,
  }) = _TokensDto;

  factory TokensDto.fromJson(Map<String, dynamic> json) =>
      _$TokensDtoFromJson(json);

  factory TokensDto.fromDomain(Tokens tokens) => TokensDto(
        access: TokenDto.fromDomain(tokens.access),
        refresh: TokenDto.fromDomain(tokens.refresh),
      );

  Tokens toDomain() => Tokens(
        access: access.toDomain(),
        refresh: refresh.toDomain(),
      );
}
