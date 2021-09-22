// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Show _$$_ShowFromJson(Map<String, dynamic> json) => _$_Show(
      id: json['id'] as String,
      averageRating: (json['average_rating'] as num?)?.toDouble(),
      description: json['description'] as String?,
      imageUrl: json['image_url'] as String?,
      noOfReviews: json['no_of_reviews'] as int,
      title: json['title'] as String,
    );

Map<String, dynamic> _$$_ShowToJson(_$_Show instance) => <String, dynamic>{
      'id': instance.id,
      'average_rating': instance.averageRating,
      'description': instance.description,
      'image_url': instance.imageUrl,
      'no_of_reviews': instance.noOfReviews,
      'title': instance.title,
    };
