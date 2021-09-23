import 'package:moor/moor.dart';

@DataClassName('DBReview')
class Reviews extends Table {
  @override
  Set<Column> get primaryKey => {id};

  TextColumn get id => text()();

  TextColumn get comment => text()();

  IntColumn get rating => integer()();

  IntColumn get showId => integer()();

  TextColumn get userId => text()();

  TextColumn get userEmail => text()();

  TextColumn get userImageUrl => text().nullable()();
}
