// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CouponModel _$$_CouponModelFromJson(Map<String, dynamic> json) =>
    _$_CouponModel(
      shippingCharge: (json['shipping_charge'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_CouponModelToJson(_$_CouponModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('shipping_charge', instance.shippingCharge);
  return val;
}
