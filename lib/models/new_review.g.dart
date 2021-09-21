// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NewReview _$_$_NewReviewFromJson(Map<String, dynamic> json) {
  return _$_NewReview(
    json['rating'] as int,
    json['comment'] as String,
    json['show_id'] as int,
  );
}

Map<String, dynamic> _$_$_NewReviewToJson(_$_NewReview instance) =>
    <String, dynamic>{
      'rating': instance.rating,
      'comment': instance.comment,
      'show_id': instance.showId,
    };
