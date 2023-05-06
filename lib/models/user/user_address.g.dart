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
      deliveryAddressId: json['delivery_address_id'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      mobileNumber: json['mobile_number'] as String?,
      altMobileNumber: json['alt_mobile_number'] as String?,
      homeNo: json['home_no'] as String?,
      street: json['street'] as String?,
      area: json['area'] as String?,
      society: json['society'] as String?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      addressType: json['address_type'] as String?,
      isDefault: json['is_default'] as String?,
      isDelete: json['is_delete'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
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
  writeNotNull('delivery_address_id', instance.deliveryAddressId);
  writeNotNull('first_name', instance.firstName);
  writeNotNull('last_name', instance.lastName);
  writeNotNull('mobile_number', instance.mobileNumber);
  writeNotNull('alt_mobile_number', instance.altMobileNumber);
  writeNotNull('home_no', instance.homeNo);
  writeNotNull('street', instance.street);
  writeNotNull('area', instance.area);
  writeNotNull('society', instance.society);
  writeNotNull('latitude', instance.latitude);
  writeNotNull('longitude', instance.longitude);
  writeNotNull('address_type', instance.addressType);
  writeNotNull('is_default', instance.isDefault);
  writeNotNull('is_delete', instance.isDelete);
  writeNotNull('created_at', instance.createdAt);
  writeNotNull('updated_at', instance.updatedAt);
  writeNotNull('rating', instance.rating);
  return val;
}
