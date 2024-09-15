import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_payload_model.freezed.dart';

@freezed
class NotificationPayloadModel with _$NotificationPayloadModel {
  const NotificationPayloadModel._();
  const factory NotificationPayloadModel(
      {required int id, required String type}) = _NotificationPayloadModel;

  // add empty method
  factory NotificationPayloadModel.empty() =>
      const NotificationPayloadModel(id: -1, type: '');
}
