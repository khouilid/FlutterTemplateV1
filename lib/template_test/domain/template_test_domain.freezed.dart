// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'template_test_domain.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TemplatetestDomain {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TemplatetestDomainCopyWith<TemplatetestDomain> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TemplatetestDomainCopyWith<$Res> {
  factory $TemplatetestDomainCopyWith(
          TemplatetestDomain value, $Res Function(TemplatetestDomain) then) =
      _$TemplatetestDomainCopyWithImpl<$Res, TemplatetestDomain>;
  @useResult
  $Res call({int id, String title});
}

/// @nodoc
class _$TemplatetestDomainCopyWithImpl<$Res, $Val extends TemplatetestDomain>
    implements $TemplatetestDomainCopyWith<$Res> {
  _$TemplatetestDomainCopyWithImpl(this._value, this._then);

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
abstract class _$$TemplatetestDomainImplCopyWith<$Res>
    implements $TemplatetestDomainCopyWith<$Res> {
  factory _$$TemplatetestDomainImplCopyWith(_$TemplatetestDomainImpl value,
          $Res Function(_$TemplatetestDomainImpl) then) =
      __$$TemplatetestDomainImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String title});
}

/// @nodoc
class __$$TemplatetestDomainImplCopyWithImpl<$Res>
    extends _$TemplatetestDomainCopyWithImpl<$Res, _$TemplatetestDomainImpl>
    implements _$$TemplatetestDomainImplCopyWith<$Res> {
  __$$TemplatetestDomainImplCopyWithImpl(_$TemplatetestDomainImpl _value,
      $Res Function(_$TemplatetestDomainImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
  }) {
    return _then(_$TemplatetestDomainImpl(
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

class _$TemplatetestDomainImpl extends _TemplatetestDomain {
  const _$TemplatetestDomainImpl({required this.id, required this.title})
      : super._();

  @override
  final int id;
  @override
  final String title;

  @override
  String toString() {
    return 'TemplatetestDomain(id: $id, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TemplatetestDomainImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TemplatetestDomainImplCopyWith<_$TemplatetestDomainImpl> get copyWith =>
      __$$TemplatetestDomainImplCopyWithImpl<_$TemplatetestDomainImpl>(
          this, _$identity);
}

abstract class _TemplatetestDomain extends TemplatetestDomain {
  const factory _TemplatetestDomain(
      {required final int id,
      required final String title}) = _$TemplatetestDomainImpl;
  const _TemplatetestDomain._() : super._();

  @override
  int get id;
  @override
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$TemplatetestDomainImplCopyWith<_$TemplatetestDomainImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
