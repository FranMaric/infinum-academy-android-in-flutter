// ignore_for_file: avoid_classes_with_only_static_members

import 'package:infinum_academy_android_flutter/common/models/show.dart';
import 'package:infinum_academy_android_flutter/source_local/database/shows_database.dart';

class DBShowMapper {
  static DBShow mapFromShow(Show show) {
    return DBShow(
      id: int.parse(show.id),
      noOfReviews: show.noOfReviews,
      title: show.title,
      averageRating: show.averageRating,
      description: show.description,
      imageUrl: show.imageUrl,
    );
  }
}
