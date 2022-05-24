// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MerchantLocation _$MerchantLocationFromJson(Map<String, dynamic> json) =>
    MerchantLocation()
      ..type = json['type'] as String?
      ..coordinates = (json['coordinates'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList();

Map<String, dynamic> _$MerchantLocationToJson(MerchantLocation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', instance.type);
  writeNotNull('coordinates', instance.coordinates);
  return val;
}
