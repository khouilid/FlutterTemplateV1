// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TokenDto _$TokenDtoFromJson(Map<String, dynamic> json) {
  return _TokenDto.fromJson(json);
}

/// @nodoc
mixin _$TokenDto {
  String get token => throw _privateConstructorUsedError;
  @JsonKey(name: 'expires')
  String get expiresAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TokenDtoCopyWith<TokenDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenDtoCopyWith<$Res> {
  factory $TokenDtoCopyWith(TokenDto value, $Res Function(TokenDto) then) =
      _$TokenDtoCopyWithImpl<$Res, TokenDto>;
  @useResult
  $Res call({String token, @JsonKey(name: 'expires') String expiresAt});
}

/// @nodoc
class _$TokenDtoCopyWithImpl<$Res, $Val extends TokenDto>
    implements $TokenDtoCopyWith<$Res> {
  _$TokenDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? expiresAt = null,
  }) {
    return _then(_value.copyWith(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TokenDtoImplCopyWith<$Res>
    implements $TokenDtoCopyWith<$Res> {
  factory _$$TokenDtoImplCopyWith(
          _$TokenDtoImpl value, $Res Function(_$TokenDtoImpl) then) =
      __$$TokenDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String token, @JsonKey(name: 'expires') String expiresAt});
}

/// @nodoc
class __$$TokenDtoImplCopyWithImpl<$Res>
    extends _$TokenDtoCopyWithImpl<$Res, _$TokenDtoImpl>
    implements _$$TokenDtoImplCopyWith<$Res> {
  __$$TokenDtoImplCopyWithImpl(
      _$TokenDtoImpl _value, $Res Function(_$TokenDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? expiresAt = null,
  }) {
    return _then(_$TokenDtoImpl(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TokenDtoImpl extends _TokenDto {
  const _$TokenDtoImpl(
      {required this.token, @JsonKey(name: 'expires') required this.expiresAt})
      : super._();

  factory _$TokenDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TokenDtoImplFromJson(json);

  @override
  final String token;
  @override
  @JsonKey(name: 'expires')
  final String expiresAt;

  @override
  String toString() {
    return 'TokenDto(token: $token, expiresAt: $expiresAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TokenDtoImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, token, expiresAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TokenDtoImplCopyWith<_$TokenDtoImpl> get copyWith =>
      __$$TokenDtoImplCopyWithImpl<_$TokenDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TokenDtoImplToJson(
      this,
    );
  }
}

abstract class _TokenDto extends TokenDto {
  const factory _TokenDto(
          {required final String token,
          @JsonKey(name: 'expires') required final String expiresAt}) =
      _$TokenDtoImpl;
  const _TokenDto._() : super._();

  factory _TokenDto.fromJson(Map<String, dynamic> json) =
      _$TokenDtoImpl.fromJson;

  @override
  String get token;
  @override
  @JsonKey(name: 'expires')
  String get expiresAt;
  @override
  @JsonKey(ignore: true)
  _$$TokenDtoImplCopyWith<_$TokenDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
