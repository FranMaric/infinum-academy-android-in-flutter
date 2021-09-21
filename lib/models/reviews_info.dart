import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'reviews_info.freezed.dart';

@freezed
abstract class ReviewsInfo with _$ReviewsInfo {
  const factory ReviewsInfo({
    required int reviewsCount,
    required double averageRating,
  }) = _ReviewsInfo;
}
