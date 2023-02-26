import 'package:freezed_annotation/freezed_annotation.dart';
part 'variant.freezed.dart';
part 'variant.g.dart';

@freezed
class Variant with _$Variant {
  @JsonSerializable(
    explicitToJson: true,
    includeIfNull: false,
    fieldRename: FieldRename.snake,
  )
  const factory Variant({
    String? id,
    String? priceUnitId,
    String? productId,
    String? purchasePrice,
    String? price,
    String? discount,
    String? unit,
    String? unitId,
    String? quantity,
    String? createdAt,
    String? updatedAt,
    String? maxQty,
    String? unitName,
  }) = _Variant;
  factory Variant.fromJson(Map<String, dynamic> json) =>
      _$VariantFromJson(json);
}
