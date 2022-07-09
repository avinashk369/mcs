import 'package:freezed_annotation/freezed_annotation.dart';
part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
class CategoryModel with _$CategoryModel {
  @JsonSerializable(
      includeIfNull: false,
      explicitToJson: true,
      fieldRename: FieldRename.snake)
  const factory CategoryModel({
    String? id,
    String? name,
    String? thumb,
  }) = _CategoryModel;
  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}
