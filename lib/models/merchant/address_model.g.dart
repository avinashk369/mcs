// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) => AddressModel()
  ..address = json['address'] as String?
  ..addressLine1 = json['address_line1'] as String?
  ..addressLine2 = json['address_line2'] as String?
  ..city = json['city'] as String?
  ..state = json['state'] as String?
  ..country = json['country'] as String?
  ..zipcode = json['zipcode'] as String?
  ..landmark = json['landmark'] as String?
  ..sId = json['s_id'] as String?;

Map<String, dynamic> _$AddressModelToJson(AddressModel instance) =>
    <String, dynamic>{
      'address': instance.address,
      'address_line1': instance.addressLine1,
      'address_line2': instance.addressLine2,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'zipcode': instance.zipcode,
      'landmark': instance.landmark,
      's_id': instance.sId,
    };
