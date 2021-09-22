import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/foundation.dart';

part 'show.freezed.dart';
part 'show.g.dart';

@freezed
@immutable
abstract class Show with _$Show {
  const factory Show({
    required String id,
    @JsonKey(name: 'average_rating') required double? averageRating,
    required String? description,
    @JsonKey(name: 'image_url') required String? imageUrl,
    @JsonKey(name: 'no_of_reviews') required int noOfReviews,
    required String title,
  }) = _Show;
  factory Show.fromJson(Map<String, dynamic> json) => _$ShowFromJson(json);
}
