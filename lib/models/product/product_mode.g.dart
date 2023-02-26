// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_mode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductModel _$$_ProductModelFromJson(Map<String, dynamic> json) =>
    _$_ProductModel(
      id: json['id'] as String?,
      productId: json['product_id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      productImage: json['product_image'] as String?,
      stockStatus: json['stock_status'] as String?,
      categoryId: json['category_id'] as String?,
      cityId: json['city_id'] as String?,
      couponCode: json['coupon_code'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      productGroup: json['product_group'] as String?,
      variant: (json['variant'] as List<dynamic>?)
          ?.map((e) => Variant.fromJson(e as Map<String, dynamic>))
          .toList(),
      rating: (json['rating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_ProductModelToJson(_$_ProductModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('product_id', instance.productId);
  writeNotNull('name', instance.name);
  writeNotNull('description', instance.description);
  writeNotNull('product_image', instance.productImage);
  writeNotNull('stock_status', instance.stockStatus);
  writeNotNull('category_id', instance.categoryId);
  writeNotNull('city_id', instance.cityId);
  writeNotNull('coupon_code', instance.couponCode);
  writeNotNull('created_at', instance.createdAt);
  writeNotNull('updated_at', instance.updatedAt);
  writeNotNull('product_group', instance.productGroup);
  writeNotNull('variant', instance.variant?.map((e) => e.toJson()).toList());
  writeNotNull('rating', instance.rating);
  return val;
}
