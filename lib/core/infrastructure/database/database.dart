import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:template/Features/profile/infrastructure/drift/user_drift.dart';

part 'database.g.dart';

const _schemas = <Type>[UserLocal];

@DriftDatabase(tables: _schemas)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'template_database');
  }
}
