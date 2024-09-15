
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:template/core/domain/failure.dart';
part "notifications_states.freezed.dart";

@freezed
class NotificationsState with _$NotificationsState {
  const NotificationsState._();
  const factory NotificationsState.loading() = _Loading;
  const factory NotificationsState.initial() = _Initial;
  const factory NotificationsState.failure(Failure error) = _Failure;

// update fcm token state success
  const factory NotificationsState.updateFcmTokenSuccess() = _UpdateFcmTokenSuccess;
}
