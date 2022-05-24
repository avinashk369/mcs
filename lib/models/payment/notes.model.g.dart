// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotesModel _$NotesModelFromJson(Map<String, dynamic> json) => NotesModel()
  ..name = json['name'] as String?
  ..rollNo = json['roll_no'] as String?;

Map<String, dynamic> _$NotesModelToJson(NotesModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('roll_no', instance.rollNo);
  return val;
}
