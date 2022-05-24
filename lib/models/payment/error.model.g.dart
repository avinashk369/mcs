// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorModel _$ErrorModelFromJson(Map<String, dynamic> json) => ErrorModel()
  ..code = json['code']
  ..description = json['description']
  ..reason = json['reason']
  ..field = json['field']
  ..step = json['step']
  ..id = json['id'] as String?
  ..source = json['source']
  ..metadata = json['metadata'];

Map<String, dynamic> _$ErrorModelToJson(ErrorModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('code', instance.code);
  writeNotNull('description', instance.description);
  writeNotNull('reason', instance.reason);
  writeNotNull('field', instance.field);
  writeNotNull('step', instance.step);
  writeNotNull('id', instance.id);
  writeNotNull('source', instance.source);
  writeNotNull('metadata', instance.metadata);
  return val;
}
