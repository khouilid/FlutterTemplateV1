// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_version_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppVersionDtoImpl _$$AppVersionDtoImplFromJson(Map<String, dynamic> json) =>
    _$AppVersionDtoImpl(
      version: json['version'] as String? ?? null,
      buildNumber: (json['build'] as num?)?.toInt() ?? null,
      optional: json['isMandatory'] as bool? ?? null,
      platform: json['platform'] as String? ?? null,
      description: json['releaseNotes'] as String? ?? null,
      appLink: json['appLink'] as String? ?? null,
      appName: json['appName'] as String? ?? null,
    );

Map<String, dynamic> _$$AppVersionDtoImplToJson(_$AppVersionDtoImpl instance) =>
    <String, dynamic>{
      'version': instance.version,
      'build': instance.buildNumber,
      'isMandatory': instance.optional,
      'platform': instance.platform,
      'releaseNotes': instance.description,
      'appLink': instance.appLink,
      'appName': instance.appName,
    };
