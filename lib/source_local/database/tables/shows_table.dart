import 'package:moor/moor.dart';

@DataClassName('DBShow')
class Shows extends Table {
  IntColumn get id => integer().autoIncrement()();

  RealColumn get averageRating => real().nullable()();

  TextColumn get description => text().nullable()();

  TextColumn get imageUrl => text().nullable()();

  IntColumn get noOfReviews => integer()();

  TextColumn get title => text()();
}
