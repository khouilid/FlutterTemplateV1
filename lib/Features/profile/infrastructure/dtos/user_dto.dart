
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/user_domain.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
class UserDto with _$UserDto {
  const UserDto._();
  const factory UserDto({
    @Default(null) String? id,
    @Default(null) bool? isEmailVerified,
    @Default(null) bool? isSamePhoneNumber,
    @Default(null) String? displayedId,
    @Default(null) String? firstName,
    @Default(null) String? lastName,
    @Default(null) String? email,
    @Default(null) String? createdAt,
    @Default(null) String? fcmToken,
    @Default(null) int? age,
    @Default(null) String? avatar,
    @Default(null) bool? isCompleted,
  }) = _UserDto;

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  factory UserDto.fromDomain(User user) => UserDto(
      id: user.id,
      isEmailVerified: user.isEmailVerified,
      firstName: user.firstName,
      lastName: user.lastName,
      email: user.email,
      createdAt: user.createdAt,
      isSamePhoneNumber: user.isSamePhoneNumber,
      displayedId: user.displayedId,
      fcmToken: user.fcmToken,
      age: user.age,
      avatar: user.avatar,
      isCompleted: user.isCompleted);

  User toDomain() => User(
      id: id ?? "",
      isEmailVerified: isEmailVerified ?? false,
      firstName: firstName ?? "",
      lastName: lastName ?? "",
      email: email ?? "",
      createdAt: createdAt ?? "",
      displayedId: displayedId ?? "",
      isSamePhoneNumber: isSamePhoneNumber ?? false,
      fcmToken: fcmToken ?? "",
      age: age ?? 0,
      avatar: avatar ?? "",
      isCompleted: isCompleted ?? false);

}
