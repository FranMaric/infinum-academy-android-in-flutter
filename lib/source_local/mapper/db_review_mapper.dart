// ignore_for_file: avoid_classes_with_only_static_members

import 'package:infinum_academy_android_flutter/common/models/review.dart';
import 'package:infinum_academy_android_flutter/source_local/database/shows_database.dart';

class DBReviewMapper {
  static DBReview mapFromReview(Review review) {
    return DBReview(
      id: review.id,
      comment: review.comment,
      rating: review.rating,
      showId: review.showId,
      userId: review.user.id,
      userEmail: review.user.email,
      userImageUrl: review.user.imageUrl,
    );
  }

  static List<DBReview> mapFromListOfReviews(List<Review> reviews) {
    return reviews.map((review) => mapFromReview(review)).toList();
  }
}
