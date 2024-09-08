import 'package:freezed_annotation/freezed_annotation.dart';

import '../../user/domain/user_domain.dart';
import 'tokens.dart';

part 'auth_response.freezed.dart';

@freezed
class AuthResponse with _$AuthResponse {
  const AuthResponse._();
  const factory AuthResponse({
    required Tokens token,
    required User user,
  }) = _AuthResponse;
}
