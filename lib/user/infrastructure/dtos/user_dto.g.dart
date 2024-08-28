// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDtoImpl _$$UserDtoImplFromJson(Map<String, dynamic> json) =>
    _$UserDtoImpl(
      id: json['id'] as String? ?? null,
      isEmailVerified: json['isEmailVerified'] as bool? ?? null,
      isSamePhoneNumber: json['isSamePhoneNumber'] as bool? ?? null,
      displayedId: json['displayedId'] as String? ?? null,
      firstName: json['firstName'] as String? ?? null,
      lastName: json['lastName'] as String? ?? null,
      email: json['email'] as String? ?? null,
      createdAt: json['createdAt'] as String? ?? null,
      fcmToken: json['fcmToken'] as String? ?? null,
      age: json['age'] as int? ?? null,
      avatar: json['avatar'] as String? ?? null,
      isCompleted: json['isCompleted'] as bool? ?? null,
    );

Map<String, dynamic> _$$UserDtoImplToJson(_$UserDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isEmailVerified': instance.isEmailVerified,
      'isSamePhoneNumber': instance.isSamePhoneNumber,
      'displayedId': instance.displayedId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'createdAt': instance.createdAt,
      'fcmToken': instance.fcmToken,
      'age': instance.age,
      'avatar': instance.avatar,
      'isCompleted': instance.isCompleted,
    };
