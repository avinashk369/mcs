// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reviews _$ReviewsFromJson(Map<String, dynamic> json) => Reviews()
  ..id = json['id'] as String?
  ..name = json['name'] as String?
  ..review = json['review'] as String?
  ..rating = json['rating'] as int?;

Map<String, dynamic> _$ReviewsToJson(Reviews instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'review': instance.review,
      'rating': instance.rating,
    };
