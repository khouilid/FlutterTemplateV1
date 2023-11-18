// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostsDtoImpl _$$PostsDtoImplFromJson(Map<String, dynamic> json) =>
    _$PostsDtoImpl(
      id: json['id'] as int?,
      title: json['title'] as String,
      body: json['body'] as String,
    );

Map<String, dynamic> _$$PostsDtoImplToJson(_$PostsDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
    };
