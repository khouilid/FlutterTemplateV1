import 'package:isar/isar.dart';

import '../../../core/infrastructure/database/fast_hash_function.dart';

part 'post_isar.g.dart';

@collection
@Name('Posts')
class PostIsar {
  late int id;
  Id get isarId => fastHash(id.toString());

  late String title;
  late String body;
}
