import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinum_academy_android_flutter/common/models/user.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/foundation.dart';

part 'review.freezed.dart';
part 'review.g.dart';

@freezed
@immutable
abstract class Review with _$Review {
  const factory Review({
    required String id,
    required String comment,
    required int rating,
    @JsonKey(name: 'show_id') required int showId,
    required User user,
  }) = _Review;
  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
}
