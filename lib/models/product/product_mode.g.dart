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
      count: json['count'] as int? ?? 0,
      index: json['index'] as int? ?? 0,
      rating: (json['rating'] as num?)?.toDouble(),
      orderId: json['order_id'] as String?,
      priceUnitId: json['price_unit_id'] as String?,
      quantity: json['quantity'] as String?,
      purchasePrice: json['purchase_price'] as String?,
      price: json['price'] as String?,
      discount: json['discount'] as String?,
      itemId: json['item_id'] as String?,
      originalPrice: json['original_price'] as String?,
      unit: json['unit'] as String?,
      total: json['total'] as int?,
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
  val['count'] = instance.count;
  val['index'] = instance.index;
  writeNotNull('rating', instance.rating);
  writeNotNull('order_id', instance.orderId);
  writeNotNull('price_unit_id', instance.priceUnitId);
  writeNotNull('quantity', instance.quantity);
  writeNotNull('purchase_price', instance.purchasePrice);
  writeNotNull('price', instance.price);
  writeNotNull('discount', instance.discount);
  writeNotNull('item_id', instance.itemId);
  writeNotNull('original_price', instance.originalPrice);
  writeNotNull('unit', instance.unit);
  writeNotNull('total', instance.total);
  return val;
}
