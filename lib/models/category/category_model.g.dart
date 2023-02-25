// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CategoryModel _$$_CategoryModelFromJson(Map<String, dynamic> json) =>
    _$_CategoryModel(
      id: json['id'] as String?,
      categoryName: json['category_name'] as String?,
      isActive: json['is_active'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      categoryImg: json['category_img'] as String?,
      displayOrder: json['display_order'] as String?,
      parent: json['parent'] as String?,
      cityId: json['city_id'] as String?,
      showOnInvoice: json['show_on_invoice'] as String?,
    );

Map<String, dynamic> _$$_CategoryModelToJson(_$_CategoryModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('category_name', instance.categoryName);
  writeNotNull('is_active', instance.isActive);
  writeNotNull('created_at', instance.createdAt);
  writeNotNull('updated_at', instance.updatedAt);
  writeNotNull('category_img', instance.categoryImg);
  writeNotNull('display_order', instance.displayOrder);
  writeNotNull('parent', instance.parent);
  writeNotNull('city_id', instance.cityId);
  writeNotNull('show_on_invoice', instance.showOnInvoice);
  return val;
}
