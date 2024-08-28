import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_update_status_model.freezed.dart';

@freezed
class AppUpdateStatusModel with _$AppUpdateStatusModel {
  const factory AppUpdateStatusModel({
    required bool updateAvailable,
    required bool optional,
    required String description,
    required String platform,
    required String appLink,
  }) = _AppUpdateStatusModel;
}
