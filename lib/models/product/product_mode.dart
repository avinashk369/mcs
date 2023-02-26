// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'variant.dart';

part 'product_mode.g.dart';
part 'product_mode.freezed.dart';

@freezed
class ProductModel with _$ProductModel {
  @JsonSerializable(
    explicitToJson: true,
    includeIfNull: false,
    fieldRename: FieldRename.snake,
  )
  const factory ProductModel({
    String? id,
    String? productId,
    String? name,
    String? description,
    String? productImage,
    String? stockStatus,
    String? categoryId,
    String? cityId,
    String? couponCode,
    String? createdAt,
    String? updatedAt,
    String? productGroup,
    List<Variant>? variant,
    @JsonKey(ignore: true) @Default(0) int count,
    double? rating,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}
