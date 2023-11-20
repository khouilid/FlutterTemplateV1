import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../../postes/infrastructure/isar/post_isar.dart';


/// in this collection schema we are going to add all the collections that we have in our database.
/// we are going to add the [PostIsarSchema] that we created in the [post_isar.dart] file.
const _isarSchemas = <CollectionSchema<Object>>[PostIsarSchema];

class IsarDatabase {
  late Isar _isar;

  Isar get isar => _isar;

  bool _hasBeenInitialize = false;

  Future<void> init() async {
    if (_hasBeenInitialize) {
      return;
    }
    final dbDirectory = await getApplicationSupportDirectory();

    _isar = await Isar.open(
      _isarSchemas,
      directory: dbDirectory.path,
    );

    _hasBeenInitialize = true;
  }
}
