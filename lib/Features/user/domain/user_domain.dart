import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:template/Features/user/infrastructure/dtos/user_dto.dart';

part 'user_domain.freezed.dart';

@freezed
class User with _$User {
  const User._();
  const factory User({
    required String id,
    required bool isEmailVerified,
    required bool isSamePhoneNumber,
    required String displayedId,
    required String firstName,
    required String lastName,
    required String email,
    required String createdAt,
    required String fcmToken,
    required int age,
    required String avatar,
    required bool isCompleted,
  }) = _User;

  factory User.empty() => User(
      id: "",
      isEmailVerified: false,
      isSamePhoneNumber: false,
      displayedId: "",
      firstName: "",
      lastName: "",
      email: "",
      createdAt: "",
      fcmToken: "",
      age: 24,
      avatar: "",
      isCompleted: false);

  factory User.fromMetadate(String? metadata) {
    Map<String, dynamic> userData = jsonDecode(metadata ?? "");
    return metadata != null
        ? UserDto.fromJson(userData).toDomain()
        : User.empty();
  }
}
