import 'package:drift/drift.dart';

part 'post_local.g.dart';

class TodoItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 6, max: 32)();
  TextColumn get body => text().named('body')();
  DateTimeColumn get createdAt => dateTime().nullable()();
}