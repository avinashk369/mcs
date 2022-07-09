// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subcat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SubcatModel _$$_SubcatModelFromJson(Map<String, dynamic> json) =>
    _$_SubcatModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      catId: json['cat_id'] as String?,
    );

Map<String, dynamic> _$$_SubcatModelToJson(_$_SubcatModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('cat_id', instance.catId);
  return val;
}
