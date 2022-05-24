// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceItem _$ServiceItemFromJson(Map<String, dynamic> json) => ServiceItem()
  ..name = json['name'] as String?
  ..id = json['id'] as String?
  ..serviceImage = json['service_image'] as String?;

Map<String, dynamic> _$ServiceItemToJson(ServiceItem instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('id', instance.id);
  writeNotNull('service_image', instance.serviceImage);
  return val;
}
