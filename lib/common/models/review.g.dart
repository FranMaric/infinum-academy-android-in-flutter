// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Review _$_$_ReviewFromJson(Map<String, dynamic> json) {
  return _$_Review(
    json['id'] as String,
    json['comment'] as String,
    json['rating'] as int,
    json['show_id'] as int,
    User.fromJson(json['user'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_ReviewToJson(_$_Review instance) => <String, dynamic>{
      'id': instance.id,
      'comment': instance.comment,
      'rating': instance.rating,
      'show_id': instance.showId,
      'user': instance.user,
    };
