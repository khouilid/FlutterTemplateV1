// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_update_status_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppUpdateStatusModel {
  bool get updateAvailable => throw _privateConstructorUsedError;
  bool get optional => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get platform => throw _privateConstructorUsedError;
  String get appLink => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppUpdateStatusModelCopyWith<AppUpdateStatusModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppUpdateStatusModelCopyWith<$Res> {
  factory $AppUpdateStatusModelCopyWith(AppUpdateStatusModel value,
          $Res Function(AppUpdateStatusModel) then) =
      _$AppUpdateStatusModelCopyWithImpl<$Res, AppUpdateStatusModel>;
  @useResult
  $Res call(
      {bool updateAvailable,
      bool optional,
      String description,
      String platform,
      String appLink});
}

/// @nodoc
class _$AppUpdateStatusModelCopyWithImpl<$Res,
        $Val extends AppUpdateStatusModel>
    implements $AppUpdateStatusModelCopyWith<$Res> {
  _$AppUpdateStatusModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? updateAvailable = null,
    Object? optional = null,
    Object? description = null,
    Object? platform = null,
    Object? appLink = null,
  }) {
    return _then(_value.copyWith(
      updateAvailable: null == updateAvailable
          ? _value.updateAvailable
          : updateAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      optional: null == optional
          ? _value.optional
          : optional // ignore: cast_nullable_to_non_nullable
              as bool,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String,
      appLink: null == appLink
          ? _value.appLink
          : appLink // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppUpdateStatusModelImplCopyWith<$Res>
    implements $AppUpdateStatusModelCopyWith<$Res> {
  factory _$$AppUpdateStatusModelImplCopyWith(_$AppUpdateStatusModelImpl value,
          $Res Function(_$AppUpdateStatusModelImpl) then) =
      __$$AppUpdateStatusModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool updateAvailable,
      bool optional,
      String description,
      String platform,
      String appLink});
}

/// @nodoc
class __$$AppUpdateStatusModelImplCopyWithImpl<$Res>
    extends _$AppUpdateStatusModelCopyWithImpl<$Res, _$AppUpdateStatusModelImpl>
    implements _$$AppUpdateStatusModelImplCopyWith<$Res> {
  __$$AppUpdateStatusModelImplCopyWithImpl(_$AppUpdateStatusModelImpl _value,
      $Res Function(_$AppUpdateStatusModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? updateAvailable = null,
    Object? optional = null,
    Object? description = null,
    Object? platform = null,
    Object? appLink = null,
  }) {
    return _then(_$AppUpdateStatusModelImpl(
      updateAvailable: null == updateAvailable
          ? _value.updateAvailable
          : updateAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      optional: null == optional
          ? _value.optional
          : optional // ignore: cast_nullable_to_non_nullable
              as bool,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String,
      appLink: null == appLink
          ? _value.appLink
          : appLink // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AppUpdateStatusModelImpl implements _AppUpdateStatusModel {
  const _$AppUpdateStatusModelImpl(
      {required this.updateAvailable,
      required this.optional,
      required this.description,
      required this.platform,
      required this.appLink});

  @override
  final bool updateAvailable;
  @override
  final bool optional;
  @override
  final String description;
  @override
  final String platform;
  @override
  final String appLink;

  @override
  String toString() {
    return 'AppUpdateStatusModel(updateAvailable: $updateAvailable, optional: $optional, description: $description, platform: $platform, appLink: $appLink)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppUpdateStatusModelImpl &&
            (identical(other.updateAvailable, updateAvailable) ||
                other.updateAvailable == updateAvailable) &&
            (identical(other.optional, optional) ||
                other.optional == optional) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.appLink, appLink) || other.appLink == appLink));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, updateAvailable, optional, description, platform, appLink);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppUpdateStatusModelImplCopyWith<_$AppUpdateStatusModelImpl>
      get copyWith =>
          __$$AppUpdateStatusModelImplCopyWithImpl<_$AppUpdateStatusModelImpl>(
              this, _$identity);
}

abstract class _AppUpdateStatusModel implements AppUpdateStatusModel {
  const factory _AppUpdateStatusModel(
      {required final bool updateAvailable,
      required final bool optional,
      required final String description,
      required final String platform,
      required final String appLink}) = _$AppUpdateStatusModelImpl;

  @override
  bool get updateAvailable;
  @override
  bool get optional;
  @override
  String get description;
  @override
  String get platform;
  @override
  String get appLink;
  @override
  @JsonKey(ignore: true)
  _$$AppUpdateStatusModelImplCopyWith<_$AppUpdateStatusModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
