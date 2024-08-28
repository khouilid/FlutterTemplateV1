import 'package:freezed_annotation/freezed_annotation.dart';

import 'token.dart';
part 'tokens.freezed.dart';

@freezed
class Tokens with _$Tokens {
  const Tokens._();
  const factory Tokens({
    required Token access,
    required Token refresh,
  }) = _Tokens;
}
