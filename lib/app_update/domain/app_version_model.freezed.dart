// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_version_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppVersionModel {
  String get version => throw _privateConstructorUsedError;
  int get build => throw _privateConstructorUsedError;
  bool get optional => throw _privateConstructorUsedError;
  String get platform => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get appLink => throw _privateConstructorUsedError;
  String get appName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppVersionModelCopyWith<AppVersionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppVersionModelCopyWith<$Res> {
  factory $AppVersionModelCopyWith(
          AppVersionModel value, $Res Function(AppVersionModel) then) =
      _$AppVersionModelCopyWithImpl<$Res, AppVersionModel>;
  @useResult
  $Res call(
      {String version,
      int build,
      bool optional,
      String platform,
      String description,
      String appLink,
      String appName});
}

/// @nodoc
class _$AppVersionModelCopyWithImpl<$Res, $Val extends AppVersionModel>
    implements $AppVersionModelCopyWith<$Res> {
  _$AppVersionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = null,
    Object? build = null,
    Object? optional = null,
    Object? platform = null,
    Object? description = null,
    Object? appLink = null,
    Object? appName = null,
  }) {
    return _then(_value.copyWith(
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      build: null == build
          ? _value.build
          : build // ignore: cast_nullable_to_non_nullable
              as int,
      optional: null == optional
          ? _value.optional
          : optional // ignore: cast_nullable_to_non_nullable
              as bool,
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      appLink: null == appLink
          ? _value.appLink
          : appLink // ignore: cast_nullable_to_non_nullable
              as String,
      appName: null == appName
          ? _value.appName
          : appName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppVersionModelImplCopyWith<$Res>
    implements $AppVersionModelCopyWith<$Res> {
  factory _$$AppVersionModelImplCopyWith(_$AppVersionModelImpl value,
          $Res Function(_$AppVersionModelImpl) then) =
      __$$AppVersionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String version,
      int build,
      bool optional,
      String platform,
      String description,
      String appLink,
      String appName});
}

/// @nodoc
class __$$AppVersionModelImplCopyWithImpl<$Res>
    extends _$AppVersionModelCopyWithImpl<$Res, _$AppVersionModelImpl>
    implements _$$AppVersionModelImplCopyWith<$Res> {
  __$$AppVersionModelImplCopyWithImpl(
      _$AppVersionModelImpl _value, $Res Function(_$AppVersionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = null,
    Object? build = null,
    Object? optional = null,
    Object? platform = null,
    Object? description = null,
    Object? appLink = null,
    Object? appName = null,
  }) {
    return _then(_$AppVersionModelImpl(
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      build: null == build
          ? _value.build
          : build // ignore: cast_nullable_to_non_nullable
              as int,
      optional: null == optional
          ? _value.optional
          : optional // ignore: cast_nullable_to_non_nullable
              as bool,
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      appLink: null == appLink
          ? _value.appLink
          : appLink // ignore: cast_nullable_to_non_nullable
              as String,
      appName: null == appName
          ? _value.appName
          : appName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AppVersionModelImpl implements _AppVersionModel {
  const _$AppVersionModelImpl(
      {required this.version,
      required this.build,
      required this.optional,
      required this.platform,
      required this.description,
      required this.appLink,
      required this.appName});

  @override
  final String version;
  @override
  final int build;
  @override
  final bool optional;
  @override
  final String platform;
  @override
  final String description;
  @override
  final String appLink;
  @override
  final String appName;

  @override
  String toString() {
    return 'AppVersionModel(version: $version, build: $build, optional: $optional, platform: $platform, description: $description, appLink: $appLink, appName: $appName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppVersionModelImpl &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.build, build) || other.build == build) &&
            (identical(other.optional, optional) ||
                other.optional == optional) &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.appLink, appLink) || other.appLink == appLink) &&
            (identical(other.appName, appName) || other.appName == appName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, version, build, optional,
      platform, description, appLink, appName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppVersionModelImplCopyWith<_$AppVersionModelImpl> get copyWith =>
      __$$AppVersionModelImplCopyWithImpl<_$AppVersionModelImpl>(
          this, _$identity);
}

abstract class _AppVersionModel implements AppVersionModel {
  const factory _AppVersionModel(
      {required final String version,
      required final int build,
      required final bool optional,
      required final String platform,
      required final String description,
      required final String appLink,
      required final String appName}) = _$AppVersionModelImpl;

  @override
  String get version;
  @override
  int get build;
  @override
  bool get optional;
  @override
  String get platform;
  @override
  String get description;
  @override
  String get appLink;
  @override
  String get appName;
  @override
  @JsonKey(ignore: true)
  _$$AppVersionModelImplCopyWith<_$AppVersionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
