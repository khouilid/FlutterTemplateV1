import 'package:freezed_annotation/freezed_annotation.dart';
part "template_test_states.freezed.dart";

@freezed
class TemplatetestState with _$TemplatetestState {
  const TemplatetestState._();
  const factory TemplatetestState.loading() = Loading;
  const factory TemplatetestState.initial() = Initial;
  const factory TemplatetestState.failure() = Failure;
}
