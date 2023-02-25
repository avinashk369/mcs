import 'package:freezed_annotation/freezed_annotation.dart';
part 'subcat_model.freezed.dart';
part 'subcat_model.g.dart';

@freezed
class SubCateModel with _$SubCateModel {
  @JsonSerializable(
      includeIfNull: false,
      explicitToJson: true,
      fieldRename: FieldRename.snake)
  const factory SubCateModel({
    String? id,
    String? categoryName,
    String? isActive,
    String? createdAt,
    String? updatedAt,
    String? categoryImg,
    String? displayOrder,
    String? parent,
    String? cityId,
    String? showOnInvoice,
  }) = _SubCateModel;
  factory SubCateModel.fromJson(Map<String, dynamic> json) =>
      _$SubCateModelFromJson(json);
}
