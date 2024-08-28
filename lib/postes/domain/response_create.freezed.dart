// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'response_create.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ResponseCreatePostModel {
  int get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ResponseCreatePostModelCopyWith<ResponseCreatePostModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseCreatePostModelCopyWith<$Res> {
  factory $ResponseCreatePostModelCopyWith(ResponseCreatePostModel value,
          $Res Function(ResponseCreatePostModel) then) =
      _$ResponseCreatePostModelCopyWithImpl<$Res, ResponseCreatePostModel>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$ResponseCreatePostModelCopyWithImpl<$Res,
        $Val extends ResponseCreatePostModel>
    implements $ResponseCreatePostModelCopyWith<$Res> {
  _$ResponseCreatePostModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResponseCreatePostModelImplCopyWith<$Res>
    implements $ResponseCreatePostModelCopyWith<$Res> {
  factory _$$ResponseCreatePostModelImplCopyWith(
          _$ResponseCreatePostModelImpl value,
          $Res Function(_$ResponseCreatePostModelImpl) then) =
      __$$ResponseCreatePostModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$ResponseCreatePostModelImplCopyWithImpl<$Res>
    extends _$ResponseCreatePostModelCopyWithImpl<$Res,
        _$ResponseCreatePostModelImpl>
    implements _$$ResponseCreatePostModelImplCopyWith<$Res> {
  __$$ResponseCreatePostModelImplCopyWithImpl(
      _$ResponseCreatePostModelImpl _value,
      $Res Function(_$ResponseCreatePostModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$ResponseCreatePostModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ResponseCreatePostModelImpl extends _ResponseCreatePostModel {
  const _$ResponseCreatePostModelImpl({required this.id}) : super._();

  @override
  final int id;

  @override
  String toString() {
    return 'ResponseCreatePostModel(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseCreatePostModelImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseCreatePostModelImplCopyWith<_$ResponseCreatePostModelImpl>
      get copyWith => __$$ResponseCreatePostModelImplCopyWithImpl<
          _$ResponseCreatePostModelImpl>(this, _$identity);
}

abstract class _ResponseCreatePostModel extends ResponseCreatePostModel {
  const factory _ResponseCreatePostModel({required final int id}) =
      _$ResponseCreatePostModelImpl;
  const _ResponseCreatePostModel._() : super._();

  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$ResponseCreatePostModelImplCopyWith<_$ResponseCreatePostModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
