// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CouponModel _$CouponModelFromJson(Map<String, dynamic> json) => CouponModel()
  ..couponCode = json['coupon_code'] as String?
  ..discount = (json['discount'] as num?)?.toDouble();

Map<String, dynamic> _$CouponModelToJson(CouponModel instance) =>
    <String, dynamic>{
      'coupon_code': instance.couponCode,
      'discount': instance.discount,
    };
