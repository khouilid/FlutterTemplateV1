// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tokens_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TokensDtoImpl _$$TokensDtoImplFromJson(Map<String, dynamic> json) =>
    _$TokensDtoImpl(
      access: TokenDto.fromJson(json['access'] as Map<String, dynamic>),
      refresh: TokenDto.fromJson(json['refresh'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TokensDtoImplToJson(_$TokensDtoImpl instance) =>
    <String, dynamic>{
      'access': instance.access,
      'refresh': instance.refresh,
    };
