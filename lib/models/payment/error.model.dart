import 'package:json_annotation/json_annotation.dart';
part 'error.model.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class ErrorModel {
  dynamic code;
  dynamic description;
  dynamic reason;
  dynamic field;
  dynamic step;
  String? id;
  dynamic source;
  dynamic metadata;

  ErrorModel();
  factory ErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorModelFromJson(json);
  Map<String, dynamic> toJson() => _$ErrorModelToJson(this);
}
