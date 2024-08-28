// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'response_create_post_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ResponseCreatePostDto _$ResponseCreatePostDtoFromJson(
    Map<String, dynamic> json) {
  return _ResponseCreatePostDto.fromJson(json);
}

/// @nodoc
mixin _$ResponseCreatePostDto {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResponseCreatePostDtoCopyWith<ResponseCreatePostDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseCreatePostDtoCopyWith<$Res> {
  factory $ResponseCreatePostDtoCopyWith(ResponseCreatePostDto value,
          $Res Function(ResponseCreatePostDto) then) =
      _$ResponseCreatePostDtoCopyWithImpl<$Res, ResponseCreatePostDto>;
  @useResult
  $Res call({@JsonKey(name: 'id') int? id});
}

/// @nodoc
class _$ResponseCreatePostDtoCopyWithImpl<$Res,
        $Val extends ResponseCreatePostDto>
    implements $ResponseCreatePostDtoCopyWith<$Res> {
  _$ResponseCreatePostDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResponseCreatePostDtoImplCopyWith<$Res>
    implements $ResponseCreatePostDtoCopyWith<$Res> {
  factory _$$ResponseCreatePostDtoImplCopyWith(
          _$ResponseCreatePostDtoImpl value,
          $Res Function(_$ResponseCreatePostDtoImpl) then) =
      __$$ResponseCreatePostDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'id') int? id});
}

/// @nodoc
class __$$ResponseCreatePostDtoImplCopyWithImpl<$Res>
    extends _$ResponseCreatePostDtoCopyWithImpl<$Res,
        _$ResponseCreatePostDtoImpl>
    implements _$$ResponseCreatePostDtoImplCopyWith<$Res> {
  __$$ResponseCreatePostDtoImplCopyWithImpl(_$ResponseCreatePostDtoImpl _value,
      $Res Function(_$ResponseCreatePostDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_$ResponseCreatePostDtoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResponseCreatePostDtoImpl extends _ResponseCreatePostDto {
  const _$ResponseCreatePostDtoImpl({@JsonKey(name: 'id') this.id}) : super._();

  factory _$ResponseCreatePostDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResponseCreatePostDtoImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;

  @override
  String toString() {
    return 'ResponseCreatePostDto(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseCreatePostDtoImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseCreatePostDtoImplCopyWith<_$ResponseCreatePostDtoImpl>
      get copyWith => __$$ResponseCreatePostDtoImplCopyWithImpl<
          _$ResponseCreatePostDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseCreatePostDtoImplToJson(
      this,
    );
  }
}

abstract class _ResponseCreatePostDto extends ResponseCreatePostDto {
  const factory _ResponseCreatePostDto({@JsonKey(name: 'id') final int? id}) =
      _$ResponseCreatePostDtoImpl;
  const _ResponseCreatePostDto._() : super._();

  factory _ResponseCreatePostDto.fromJson(Map<String, dynamic> json) =
      _$ResponseCreatePostDtoImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(ignore: true)
  _$$ResponseCreatePostDtoImplCopyWith<_$ResponseCreatePostDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
