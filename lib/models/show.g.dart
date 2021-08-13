// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Show _$_$_ShowFromJson(Map<String, dynamic> json) {
  return _$_Show(
    json['id'] as String,
    json['average_rating'] as int?,
    json['description'] as String?,
    json['image_url'] as String?,
    json['no_of_reviews'] as int,
    json['title'] as String,
  );
}

Map<String, dynamic> _$_$_ShowToJson(_$_Show instance) => <String, dynamic>{
      'id': instance.id,
      'average_rating': instance.averageRating,
      'description': instance.description,
      'image_url': instance.imageUrl,
      'no_of_reviews': instance.noOfReviews,
      'title': instance.title,
    };
