import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/foundation.dart';

part 'new_review.freezed.dart';
part 'new_review.g.dart';

@freezed
@immutable
abstract class NewReview with _$NewReview {
  const factory NewReview(
    int rating,
    String comment,
    @JsonKey(name: 'show_id') int showId,
  ) = _NewReview;
  factory NewReview.fromJson(Map<String, dynamic> json) => _$NewReviewFromJson(json);
}
