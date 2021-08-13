import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinum_academy_android_flutter/models/user.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/foundation.dart';

part 'review.freezed.dart';
part 'review.g.dart';

@freezed
@immutable
abstract class Review with _$Review {
  const factory Review(String id, String comment, int rating,
      @JsonKey(name: 'show_id') int showId, User user) = _Review;
  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
}
