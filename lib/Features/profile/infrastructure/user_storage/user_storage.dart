


import '../dtos/user_dto.dart';

abstract class UserStorage {
  Future<UserDto?> read();
  Future<void> save(UserDto user);
  Future<void> clear();
}
