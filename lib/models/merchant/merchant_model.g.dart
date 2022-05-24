// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MerchantModel _$MerchantModelFromJson(Map<String, dynamic> json) =>
    MerchantModel()
      ..id = json['_id'] as String?
      ..name = json['name'] as String?
      ..address = json['address'] == null
          ? null
          : AddressModel.fromJson(json['address'] as Map<String, dynamic>)
      ..lat = (json['lat'] as num?)?.toDouble()
      ..lng = (json['lng'] as num?)?.toDouble()
      ..rating = (json['rating'] as num?)?.toDouble()
      ..hrRate = (json['hr_rate'] as num?)?.toDouble()
      ..spots = json['spots'] as int?
      ..about = json['about'] as String?
      ..contactId = json['contact_id'] as String?
      ..fAccId = json['f_acc_id'] as String?
      ..location = json['location'] == null
          ? null
          : MerchantLocation.fromJson(json['location'] as Map<String, dynamic>)
      ..data = (json['data'] as List<dynamic>?)
          ?.map((e) => MerchantModel.fromJson(e as Map<String, dynamic>))
          .toList()
      ..reviews = (json['reviews'] as List<dynamic>?)
          ?.map((e) => Reviews.fromJson(e as Map<String, dynamic>))
          .toList()
      ..facilities = (json['facilities'] as List<dynamic>?)
          ?.map((e) => Facilities.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$MerchantModelToJson(MerchantModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('address', instance.address);
  writeNotNull('lat', instance.lat);
  writeNotNull('lng', instance.lng);
  writeNotNull('rating', instance.rating);
  writeNotNull('hr_rate', instance.hrRate);
  writeNotNull('spots', instance.spots);
  writeNotNull('about', instance.about);
  writeNotNull('contact_id', instance.contactId);
  writeNotNull('f_acc_id', instance.fAccId);
  writeNotNull('location', instance.location);
  writeNotNull('data', instance.data);
  writeNotNull('reviews', instance.reviews);
  writeNotNull('facilities', instance.facilities);
  return val;
}
