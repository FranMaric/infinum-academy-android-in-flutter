// ignore_for_file: avoid_classes_with_only_static_members

import 'package:infinum_academy_android_flutter/common/models/review.dart';
import 'package:infinum_academy_android_flutter/common/models/user.dart';
import 'package:infinum_academy_android_flutter/source_local/database/shows_database.dart';

class ReviewMapper {
  static Review mapFromDBReview(DBReview dbReview) {
    return Review(
      id: dbReview.id,
      comment: dbReview.comment,
      rating: dbReview.rating,
      showId: dbReview.showId,
      user: User(
        id: dbReview.userId,
        email: dbReview.userEmail,
        imageUrl: dbReview.userImageUrl,
      ),
    );
  }

  static List<Review> mapFromListOfDBReviews(List<DBReview> dbReviews) {
    return dbReviews.map((dbReview) => mapFromDBReview(dbReview)).toList();
  }
}
