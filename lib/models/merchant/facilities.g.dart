// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facilities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Facilities _$FacilitiesFromJson(Map<String, dynamic> json) => Facilities()
  ..id = json['id'] as String?
  ..name = json['name'] as String?
  ..facilityIcon = json['facility_icon'] as String?;

Map<String, dynamic> _$FacilitiesToJson(Facilities instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'facility_icon': instance.facilityIcon,
    };
