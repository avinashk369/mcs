import 'package:freezed_annotation/freezed_annotation.dart';
part 'subcat_model.freezed.dart';
part 'subcat_model.g.dart';

@freezed
class SubcatModel with _$SubcatModel {
  @JsonSerializable(
      includeIfNull: false,
      explicitToJson: true,
      fieldRename: FieldRename.snake)
  const factory SubcatModel({
    String? id,
    String? name,
    String? catId,
  }) = _SubcatModel;
  factory SubcatModel.fromJson(Map<String, dynamic> json) =>
      _$SubcatModelFromJson(json);
}
