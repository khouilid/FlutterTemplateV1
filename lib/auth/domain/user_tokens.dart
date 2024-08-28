import 'package:freezed_annotation/freezed_annotation.dart';

import '../../user/domain/user_domain.dart';
import 'tokens.dart';

part 'user_tokens.freezed.dart';

@freezed
class UserTokens with _$UserTokens {
  const UserTokens._();
  const factory UserTokens({
    required User user,
    required Tokens tokens,
  }) = _UserTokens;
}
