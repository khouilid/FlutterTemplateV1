import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:template/Features/user/infrastructure/dtos/user_dto.dart';

import '../../domain/auth_response.dart';
import 'token_dto.dart';
import 'tokens_dto.dart';

part 'auth_response_dto.freezed.dart';
part 'auth_response_dto.g.dart';

@freezed
class AuthResponseDto with _$AuthResponseDto {
  const AuthResponseDto._();
  const factory AuthResponseDto({
    required TokensDto tokens,
    required UserDto user,
  }) = _AuthResponseDto;

  factory AuthResponseDto.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseDtoFromJson(json);

  factory AuthResponseDto.fromDomain(AuthResponse response) => AuthResponseDto(
        tokens: TokensDto.fromDomain(response.token),
        user: UserDto.fromDomain(response.user),
      );

  AuthResponse toDomain() => AuthResponse(
        token: tokens.toDomain(),
        user: user.toDomain(),
      );
}
