import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:template/core/domain/failure.dart';
import 'package:template/Features/user/domain/user_domain.dart';

part 'auth_notifier.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const AuthState._();
  const factory AuthState.initial() = _Initial;
  const factory AuthState.authenticated(User user) = _Authenticated;
  const factory AuthState.unauthenticated() = _Unauthenticated;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.failure(Failure failure) = _Failure;
}
