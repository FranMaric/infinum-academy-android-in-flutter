import 'package:infinum_academy_android_flutter/source_local/database/tables/reviews_table.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:infinum_academy_android_flutter/source_local/database/shows_database.dart';

part 'review_dao.g.dart';

@UseDao(tables: [Reviews])
class ReviewDao extends DatabaseAccessor<ShowsDatabase> with _$ReviewDaoMixin {
  ReviewDao(ShowsDatabase db) : super(db);

  Future<List<DBReview>> getReviews(int showId) => (select(reviews)..where((r) => r.showId.equals(showId))).get();

  Future<void> addReviews(List<Insertable<DBReview>> newReviews) async {
    await batch((batch) => batch.insertAll(reviews, newReviews, mode: InsertMode.replace));
  }

  Future<void> addReview(Insertable<DBReview> review) => into(reviews).insert(review);

  Future<List<DBReview>> getOfflineReviews() => (select(reviews)..where((r) => r.id.equals('offline'))).get();

  Future<void> deleteReview(Insertable<DBReview> review) => delete(reviews).delete(review);
}
