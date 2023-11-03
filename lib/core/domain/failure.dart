import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  const Failure._();
  const factory Failure.server(int? code, String? message) = _Server;
  const factory Failure.storage([String? message]) = _Storage;
  const factory Failure.network([String? message]) = _Network;
  const factory Failure.unknown([String? message]) = _Unknown;
}
