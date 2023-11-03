import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';



const _isarSchemas = <CollectionSchema<Object>>[];

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
