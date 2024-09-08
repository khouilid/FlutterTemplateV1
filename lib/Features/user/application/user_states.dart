import 'package:freezed_annotation/freezed_annotation.dart';
part "user_states.freezed.dart";

@freezed
class UserState with _$UserState {
  const UserState._();
  const factory UserState.loading() = _Loading;
  const factory UserState.initial() = _Initial;
  const factory UserState.failure() = _Failure;
}
