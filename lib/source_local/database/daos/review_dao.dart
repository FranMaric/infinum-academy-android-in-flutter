import 'package:infinum_academy_android_flutter/source_local/database/tables/reviews_table.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:infinum_academy_android_flutter/source_local/database/shows_database.dart';

part 'review_dao.g.dart';

@UseDao(tables: [Reviews])
class ReviewDao extends DatabaseAccessor<ShowsDatabase> with _$ReviewDaoMixin {
  ReviewDao(ShowsDatabase db) : super(db);
}
