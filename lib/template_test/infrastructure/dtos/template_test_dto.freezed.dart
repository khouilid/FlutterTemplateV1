// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'template_test_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TemplatetestDto _$TemplatetestDtoFromJson(Map<String, dynamic> json) {
  return _TemplatetestDto.fromJson(json);
}

/// @nodoc
mixin _$TemplatetestDto {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TemplatetestDtoCopyWith<TemplatetestDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TemplatetestDtoCopyWith<$Res> {
  factory $TemplatetestDtoCopyWith(
          TemplatetestDto value, $Res Function(TemplatetestDto) then) =
      _$TemplatetestDtoCopyWithImpl<$Res, TemplatetestDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id, @JsonKey(name: 'title') String title});
}

/// @nodoc
class _$TemplatetestDtoCopyWithImpl<$Res, $Val extends TemplatetestDto>
    implements $TemplatetestDtoCopyWith<$Res> {
  _$TemplatetestDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TemplatetestDtoImplCopyWith<$Res>
    implements $TemplatetestDtoCopyWith<$Res> {
  factory _$$TemplatetestDtoImplCopyWith(_$TemplatetestDtoImpl value,
          $Res Function(_$TemplatetestDtoImpl) then) =
      __$$TemplatetestDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id, @JsonKey(name: 'title') String title});
}

/// @nodoc
class __$$TemplatetestDtoImplCopyWithImpl<$Res>
    extends _$TemplatetestDtoCopyWithImpl<$Res, _$TemplatetestDtoImpl>
    implements _$$TemplatetestDtoImplCopyWith<$Res> {
  __$$TemplatetestDtoImplCopyWithImpl(
      _$TemplatetestDtoImpl _value, $Res Function(_$TemplatetestDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
  }) {
    return _then(_$TemplatetestDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TemplatetestDtoImpl extends _TemplatetestDto {
  const _$TemplatetestDtoImpl(
      {@JsonKey(name: 'id') this.id = 0,
      @JsonKey(name: 'title') this.title = ""})
      : super._();

  factory _$TemplatetestDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TemplatetestDtoImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'title')
  final String title;

  @override
  String toString() {
    return 'TemplatetestDto(id: $id, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TemplatetestDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TemplatetestDtoImplCopyWith<_$TemplatetestDtoImpl> get copyWith =>
      __$$TemplatetestDtoImplCopyWithImpl<_$TemplatetestDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TemplatetestDtoImplToJson(
      this,
    );
  }
}

abstract class _TemplatetestDto extends TemplatetestDto {
  const factory _TemplatetestDto(
      {@JsonKey(name: 'id') final int id,
      @JsonKey(name: 'title') final String title}) = _$TemplatetestDtoImpl;
  const _TemplatetestDto._() : super._();

  factory _TemplatetestDto.fromJson(Map<String, dynamic> json) =
      _$TemplatetestDtoImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'title')
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$TemplatetestDtoImplCopyWith<_$TemplatetestDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
