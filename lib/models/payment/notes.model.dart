import 'package:json_annotation/json_annotation.dart';
part 'notes.model.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class NotesModel {
  String? name;
  String? rollNo;
  NotesModel();
  factory NotesModel.fromJson(Map<String, dynamic> json) =>
      _$NotesModelFromJson(json);
  Map<String, dynamic> toJson() => _$NotesModelToJson(this);
}
