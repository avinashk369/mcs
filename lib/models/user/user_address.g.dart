// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserAddress _$$_UserAddressFromJson(Map<String, dynamic> json) =>
    _$_UserAddress(
      id: json['id'] as String?,
      userId: json['user_id'] as String?,
      name: json['name'] as String?,
      number: json['number'] as String?,
      state: json['state'] as String?,
      city: json['city'] as String?,
      address: json['address'] as String?,
      pincode: json['pincode'] as String?,
      landmark: json['landmark'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_UserAddressToJson(_$_UserAddress instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('user_id', instance.userId);
  writeNotNull('name', instance.name);
  writeNotNull('number', instance.number);
  writeNotNull('state', instance.state);
  writeNotNull('city', instance.city);
  writeNotNull('address', instance.address);
  writeNotNull('pincode', instance.pincode);
  writeNotNull('landmark', instance.landmark);
  writeNotNull('rating', instance.rating);
  return val;
}
