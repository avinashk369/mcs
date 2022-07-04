// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_mode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductModel _$$_ProductModelFromJson(Map<String, dynamic> json) =>
    _$_ProductModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      desc: json['desc'] as String?,
      thumbnail: json['thumbnail'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      offerPrice: (json['offer_price'] as num?)?.toDouble(),
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
  writeNotNull('name', instance.name);
  writeNotNull('desc', instance.desc);
  writeNotNull('thumbnail', instance.thumbnail);
  writeNotNull('price', instance.price);
  writeNotNull('offer_price', instance.offerPrice);
  writeNotNull('rating', instance.rating);
  return val;
}
