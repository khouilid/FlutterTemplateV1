import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'user_local.g.dart';

class UserLocal extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 6, max: 32)();
  TextColumn get content => text().named('body')();
  DateTimeColumn get createdAt => dateTime().nullable()();
}
