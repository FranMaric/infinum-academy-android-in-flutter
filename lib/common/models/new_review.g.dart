// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NewReview _$$_NewReviewFromJson(Map<String, dynamic> json) => _$_NewReview(
      rating: json['rating'] as int,
      comment: json['comment'] as String,
      showId: json['show_id'] as int,
    );

Map<String, dynamic> _$$_NewReviewToJson(_$_NewReview instance) =>
    <String, dynamic>{
      'rating': instance.rating,
      'comment': instance.comment,
      'show_id': instance.showId,
    };
