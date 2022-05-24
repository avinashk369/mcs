// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleType _$VehicleTypeFromJson(Map<String, dynamic> json) => VehicleType()
  ..id = json['_id'] as String?
  ..vType = json['v_type'] as String?
  ..img = json['img'] as String?;

Map<String, dynamic> _$VehicleTypeToJson(VehicleType instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'v_type': instance.vType,
      'img': instance.img,
    };
