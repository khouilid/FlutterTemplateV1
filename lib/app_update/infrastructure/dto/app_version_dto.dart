import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/app_version_model.dart';

part 'app_version_dto.freezed.dart';
part 'app_version_dto.g.dart';

@freezed
class AppVersionDto with _$AppVersionDto {
  const AppVersionDto._();
  const factory AppVersionDto({
    @Default(null) String? version,
    @JsonKey(name: 'build') @Default(null) int? buildNumber,
    @JsonKey(name: 'isMandatory') @Default(null) bool? optional,
    @JsonKey(name: "platform") @Default(null) String? platform,
    @JsonKey(name: "releaseNotes") @Default(null) String? description,
    @JsonKey(name: "appLink") @Default(null) String? appLink,
    @JsonKey(name: "appName") @Default(null) String? appName,
  }) = _AppVersionDto;

  factory AppVersionDto.fromJson(Map<String, dynamic> json) =>
      _$AppVersionDtoFromJson(json);

  // from domain to dto
  factory AppVersionDto.fromDomain(AppVersionModel model) => AppVersionDto(
        version: model.version,
        optional: model.optional,
        buildNumber: model.build,
        platform: model.platform,
        description: model.description,
        appLink: model.appLink,
        appName: model.appName,
      );

  //to domain
  AppVersionModel toDomain() => AppVersionModel(
        version: version ?? "",
        build: buildNumber ?? 0,
        optional: optional ?? true,
        platform: platform ?? "",
        description: description ?? "",
        appLink: appLink ?? "",
        appName: appName ?? "",
      );
}
