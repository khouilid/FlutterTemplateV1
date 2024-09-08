import 'package:isar/isar.dart';
import 'package:template/core/infrastructure/database/fast_hash_function.dart';

part 'user_isar.g.dart';

@collection
@Name('User')
class UserIsar {
  late int id;
  Id get isarId => fastHash("${id}");
  late bool isEmailVerified;
  late bool isSamePhoneNumber;
  late String firstName;
  late String displayedId;
  late String lastName;
  late String email;
  late String createdAt;
}
