// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_version_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppVersionDto _$AppVersionDtoFromJson(Map<String, dynamic> json) {
  return _AppVersionDto.fromJson(json);
}

/// @nodoc
mixin _$AppVersionDto {
  String? get version => throw _privateConstructorUsedError;
  @JsonKey(name: 'build')
  int? get buildNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'isMandatory')
  bool? get optional => throw _privateConstructorUsedError;
  @JsonKey(name: "platform")
  String? get platform => throw _privateConstructorUsedError;
  @JsonKey(name: "releaseNotes")
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: "appLink")
  String? get appLink => throw _privateConstructorUsedError;
  @JsonKey(name: "appName")
  String? get appName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppVersionDtoCopyWith<AppVersionDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppVersionDtoCopyWith<$Res> {
  factory $AppVersionDtoCopyWith(
          AppVersionDto value, $Res Function(AppVersionDto) then) =
      _$AppVersionDtoCopyWithImpl<$Res, AppVersionDto>;
  @useResult
  $Res call(
      {String? version,
      @JsonKey(name: 'build') int? buildNumber,
      @JsonKey(name: 'isMandatory') bool? optional,
      @JsonKey(name: "platform") String? platform,
      @JsonKey(name: "releaseNotes") String? description,
      @JsonKey(name: "appLink") String? appLink,
      @JsonKey(name: "appName") String? appName});
}

/// @nodoc
class _$AppVersionDtoCopyWithImpl<$Res, $Val extends AppVersionDto>
    implements $AppVersionDtoCopyWith<$Res> {
  _$AppVersionDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = freezed,
    Object? buildNumber = freezed,
    Object? optional = freezed,
    Object? platform = freezed,
    Object? description = freezed,
    Object? appLink = freezed,
    Object? appName = freezed,
  }) {
    return _then(_value.copyWith(
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String?,
      buildNumber: freezed == buildNumber
          ? _value.buildNumber
          : buildNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      optional: freezed == optional
          ? _value.optional
          : optional // ignore: cast_nullable_to_non_nullable
              as bool?,
      platform: freezed == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      appLink: freezed == appLink
          ? _value.appLink
          : appLink // ignore: cast_nullable_to_non_nullable
              as String?,
      appName: freezed == appName
          ? _value.appName
          : appName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppVersionDtoImplCopyWith<$Res>
    implements $AppVersionDtoCopyWith<$Res> {
  factory _$$AppVersionDtoImplCopyWith(
          _$AppVersionDtoImpl value, $Res Function(_$AppVersionDtoImpl) then) =
      __$$AppVersionDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? version,
      @JsonKey(name: 'build') int? buildNumber,
      @JsonKey(name: 'isMandatory') bool? optional,
      @JsonKey(name: "platform") String? platform,
      @JsonKey(name: "releaseNotes") String? description,
      @JsonKey(name: "appLink") String? appLink,
      @JsonKey(name: "appName") String? appName});
}

/// @nodoc
class __$$AppVersionDtoImplCopyWithImpl<$Res>
    extends _$AppVersionDtoCopyWithImpl<$Res, _$AppVersionDtoImpl>
    implements _$$AppVersionDtoImplCopyWith<$Res> {
  __$$AppVersionDtoImplCopyWithImpl(
      _$AppVersionDtoImpl _value, $Res Function(_$AppVersionDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = freezed,
    Object? buildNumber = freezed,
    Object? optional = freezed,
    Object? platform = freezed,
    Object? description = freezed,
    Object? appLink = freezed,
    Object? appName = freezed,
  }) {
    return _then(_$AppVersionDtoImpl(
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String?,
      buildNumber: freezed == buildNumber
          ? _value.buildNumber
          : buildNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      optional: freezed == optional
          ? _value.optional
          : optional // ignore: cast_nullable_to_non_nullable
              as bool?,
      platform: freezed == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      appLink: freezed == appLink
          ? _value.appLink
          : appLink // ignore: cast_nullable_to_non_nullable
              as String?,
      appName: freezed == appName
          ? _value.appName
          : appName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppVersionDtoImpl extends _AppVersionDto {
  const _$AppVersionDtoImpl(
      {this.version = null,
      @JsonKey(name: 'build') this.buildNumber = null,
      @JsonKey(name: 'isMandatory') this.optional = null,
      @JsonKey(name: "platform") this.platform = null,
      @JsonKey(name: "releaseNotes") this.description = null,
      @JsonKey(name: "appLink") this.appLink = null,
      @JsonKey(name: "appName") this.appName = null})
      : super._();

  factory _$AppVersionDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppVersionDtoImplFromJson(json);

  @override
  @JsonKey()
  final String? version;
  @override
  @JsonKey(name: 'build')
  final int? buildNumber;
  @override
  @JsonKey(name: 'isMandatory')
  final bool? optional;
  @override
  @JsonKey(name: "platform")
  final String? platform;
  @override
  @JsonKey(name: "releaseNotes")
  final String? description;
  @override
  @JsonKey(name: "appLink")
  final String? appLink;
  @override
  @JsonKey(name: "appName")
  final String? appName;

  @override
  String toString() {
    return 'AppVersionDto(version: $version, buildNumber: $buildNumber, optional: $optional, platform: $platform, description: $description, appLink: $appLink, appName: $appName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppVersionDtoImpl &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.buildNumber, buildNumber) ||
                other.buildNumber == buildNumber) &&
            (identical(other.optional, optional) ||
                other.optional == optional) &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.appLink, appLink) || other.appLink == appLink) &&
            (identical(other.appName, appName) || other.appName == appName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, version, buildNumber, optional,
      platform, description, appLink, appName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppVersionDtoImplCopyWith<_$AppVersionDtoImpl> get copyWith =>
      __$$AppVersionDtoImplCopyWithImpl<_$AppVersionDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppVersionDtoImplToJson(
      this,
    );
  }
}

abstract class _AppVersionDto extends AppVersionDto {
  const factory _AppVersionDto(
      {final String? version,
      @JsonKey(name: 'build') final int? buildNumber,
      @JsonKey(name: 'isMandatory') final bool? optional,
      @JsonKey(name: "platform") final String? platform,
      @JsonKey(name: "releaseNotes") final String? description,
      @JsonKey(name: "appLink") final String? appLink,
      @JsonKey(name: "appName") final String? appName}) = _$AppVersionDtoImpl;
  const _AppVersionDto._() : super._();

  factory _AppVersionDto.fromJson(Map<String, dynamic> json) =
      _$AppVersionDtoImpl.fromJson;

  @override
  String? get version;
  @override
  @JsonKey(name: 'build')
  int? get buildNumber;
  @override
  @JsonKey(name: 'isMandatory')
  bool? get optional;
  @override
  @JsonKey(name: "platform")
  String? get platform;
  @override
  @JsonKey(name: "releaseNotes")
  String? get description;
  @override
  @JsonKey(name: "appLink")
  String? get appLink;
  @override
  @JsonKey(name: "appName")
  String? get appName;
  @override
  @JsonKey(ignore: true)
  _$$AppVersionDtoImplCopyWith<_$AppVersionDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
