
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:template/Features/notifications/domain/notification_payload_model.dart';

part 'notification_payload_dto.freezed.dart';
part 'notification_payload_dto.g.dart';

@freezed
class NotificationPayloadDto with _$NotificationPayloadDto {
  const NotificationPayloadDto._();
  const factory NotificationPayloadDto({
    int? id,
    String? type,
  }) = _NotificationPayloadDto;

  factory NotificationPayloadDto.fromJson(Map<String, dynamic> json) =>
      _$NotificationPayloadDtoFromJson(json);

  // TO DOMAIN
  NotificationPayloadModel toDomain() {
    return NotificationPayloadModel(
      id: id ?? -1,
      type: type ?? '',
    );
  }
}
