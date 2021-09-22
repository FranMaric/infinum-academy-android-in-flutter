import 'package:moor/moor.dart';

@DataClassName('DBReview')
class Reviews extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get comment => text()();

  IntColumn get rating => integer()();

  IntColumn get showId => integer()();

  //TODO: Missing user :(
}
